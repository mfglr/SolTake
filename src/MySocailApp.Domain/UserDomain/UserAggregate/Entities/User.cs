using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;
using MySocailApp.Domain.UserDomain.UserAggregate.ValueObjects;

namespace MySocailApp.Domain.UserDomain.UserAggregate.Entities
{
    public class User : Entity, IAggregateRoot
    {
        public UserName UserName { get; private set; }
        public Email Email { get; private set; }
        public Password? Password { get; private set; }
        public Language Language { get; private set; }
        public GoogleAccount? GoogleAccount { get; private set; }
        public string SecurityStamp { get; private set; }
        public Multimedia? Image { get; private set; }
        public string? Name { get; private set; }
        public Biography? Biography { get; private set; }
        private readonly List<UserRole> _roles = [];
        public IReadOnlyCollection<UserRole> Roles => _roles;
        public bool IsSendableEmailVerificationMail => GoogleAccount == null;

        public string AccessToken { get; internal set; } = null!; //not mapped
        public string RefreshToken { get; internal set; } = null!; //not mapped

        private User() { }

        public User(Email email, Password password, Password passwordConfirm, Language language)
        {
            if (!password.CompareValue(passwordConfirm))
                throw new PassowordAndPasswordConfirmationNotMatchException();

            Password = password;
            Email = email;
            UserName = email.GenerateUserName();
            Language = language;
            SecurityStamp = GenerateSecurityStamp();
        }
        public User(GoogleAccount googleAccount, Language language)
        {
            GoogleAccount = googleAccount;
            Email = new(googleAccount.Email);
            UserName = Email.GenerateUserName();
            Language = language;
            SecurityStamp = GenerateSecurityStamp();
        }
        internal void Create(int policyId, int termsOfUseId)
        {
            if (GoogleAccount == null)
                _verificationTokens.Add(EmailVerificationToken.Create());

            _roles.Add(new((int)ValueObjects.Roles.user));
            _privacyPolicies.Add(UserPrivacyPolicy.Create(policyId));
            _termsOfUses.Add(UserTermsOfUse.Create(termsOfUseId));
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new UserCreatedDominEvent(this));
        }

        public void UpdateImage(Multimedia image)
        {
            if (Image != null)
                AddDomainEvent(new ProfileImageDeletedDomainEvent(Image));
            Image = image;
        }
        public void RemoveImage()
        {
            if (Image == null)
                throw new UserImageIsNotAvailableException();
            AddDomainEvent(new ProfileImageDeletedDomainEvent(Image));
            Image = null;
        }

        public void UpdateName(string name)
        {
            Name = name;
            UpdatedAt = DateTime.UtcNow;
        }
        public void UpdateBiography(Biography biography)
        {
            Biography = biography;
            UpdatedAt = DateTime.UtcNow;
        }

        //following
        private readonly List<Follow> _followers = [];
        public IReadOnlyList<Follow> Followers => _followers;
        private readonly List<UserFollowNotification> _userFollowNotifications = [];
        public IReadOnlyCollection<UserFollowNotification> UserFollowNotifications => _userFollowNotifications;
        public Follow Follow(int followerId)
        {
            if (followerId == Id)
                throw new PermissionDeniedToFollowYourselfException();
            if (_followers.Any(x => x.FollowerId == followerId))
                throw new UserIsAlreadyFollowedException();

            var follow = Entities.Follow.Create(followerId, Id);
            _followers.Add(follow);

            var notification = _userFollowNotifications.FirstOrDefault(x => x.FollowerId == followerId);
            if (notification == null || DateTime.UtcNow >= notification.CreatedAt.AddDays(1))
            {
                if (notification != null) _userFollowNotifications.Remove(notification);
                _userFollowNotifications.Add(UserFollowNotification.Create(followerId));
                AddDomainEvent(new UserFollowedDomainEvent(follow));
            }
            return follow;
        }
        public void Unfollow(int followerId)
        {
            var index = _followers.FindIndex(x => x.FollowerId == followerId);
            if (index == -1) return;
            _followers.RemoveAt(index);

            AddDomainEvent(new UserUnfollowedDomainEvent(followerId, Id));
        }
        public void RemoveFollower(int followerId)
        {
            var index = _followers.FindIndex(x => x.FollowerId == followerId);
            if (index == -1) return;
            _followers.RemoveAt(index);
        }

        //searchings
        private readonly List<UserSearch> _searchers = [];
        public IReadOnlyCollection<UserSearch> Searchers => _searchers;
        public UserSearch AddSearcher(int searcherId)
        {
            var index = _searchers.FindIndex(x => x.SearcherId == searcherId);
            if (index != -1)
                _searchers.RemoveAt(index);
            var search = UserSearch.Create(searcherId);
            _searchers.Add(search);
            return search;
        }
        public void RemoveSearcher(int searcherId)
        {
            var index = _searchers.FindIndex(x => x.SearcherId == searcherId);
            if (index == -1) return;
            _searchers.RemoveAt(index);
        }

        private static string GenerateSecurityStamp() => Guid.NewGuid().ToString().Replace("-", "").ToUpper();

        internal void UpdateUserName(UserName userName)
        {
            UserName = userName;
            UpdatedAt = DateTime.UtcNow;
        }

        internal void UpdateEmail(Email email)
        {
            _verificationTokens.Add(EmailVerificationToken.Create());
            Email = email;
            UpdatedAt = DateTime.UtcNow;
            AddDomainEvent(new EmailVerificationTokenUpdatedDomainEvent(this));
        }

        public void UpdateLanguage(Language language)
        {
            Language = language;
            UpdatedAt = DateTime.UtcNow;
        }

        //Email verfication Tokens
        public EmailVerificationToken VerificationToken => VerificationTokens.OrderBy(x => x.Id).Last();
        public bool IsEmailVerified => GoogleAccount != null || VerificationToken.IsVerified;
        private readonly List<EmailVerificationToken> _verificationTokens = [];
        public IReadOnlyCollection<EmailVerificationToken> VerificationTokens => _verificationTokens;
        public void UpdateEmailVerificationToken()
        {
            if (IsEmailVerified)
                throw new EmailAlreadyVerifiedException();

            var sortedTokens = _verificationTokens.OrderByDescending(x => x.Id);
            if (sortedTokens.Count() >= 5)
            {
                var fivethTokenFromTheStart = sortedTokens.ElementAt(4);
                if (DateTime.UtcNow <= fivethTokenFromTheStart.CreatedAt.AddHours(1))
                    throw new TooManyGeneratedTokenException();
            }
            _verificationTokens.Add(EmailVerificationToken.Create());
            AddDomainEvent(new EmailVerificationTokenUpdatedDomainEvent(this));
        }
        public void VerifyEmail(string token)
        {
            if (IsEmailVerified) return;

            var verificationToken = _verificationTokens.OrderBy(x => x.Id).Last();
            verificationToken.Verify(token);
        }

        //Password Reset tokens
        private readonly List<PasswordResetToken> _passwordResetTokens = [];
        public PasswordResetToken? PasswordResetToken => _passwordResetTokens.OrderBy(x => x.Id).LastOrDefault();
        public IReadOnlyCollection<PasswordResetToken> PasswordResestTokens => _passwordResetTokens;
        public void GeneratePasswordResetToken()
        {
            var sortedTokens = _passwordResetTokens.OrderByDescending(x => x.Id);
            if (sortedTokens.Count() >= 5)
            {
                var fivethTokenFromTheStart = sortedTokens.ElementAt(4);
                if (DateTime.UtcNow <= fivethTokenFromTheStart.CreatedAt.AddHours(1))
                    throw new TooManyGeneratedTokenException();
            }
            _passwordResetTokens.Add(PasswordResetToken.Create());
            AddDomainEvent(new PasswordResetTokenGeneratedDomainEvent(this));
        }
        public void ResetPassword(string token, Password password, Password passwordConfirm)
        {
            if (!password.CompareValue(passwordConfirm))
                throw new PassowordAndPasswordConfirmationNotMatchException();

            var passworResetToken = PasswordResetToken ?? throw new InvalidTokenException();
            passworResetToken.Check(token);

            Password = password;
        }

        //privacyPolicies
        public UserPrivacyPolicy PrivacyPolicy => PrivacyPolicies.OrderBy(x => x.PravicyPolicyId).Last();
        public bool IsPrivacyPolicyApproved => PrivacyPolicy.IsApproved;
        public readonly List<UserPrivacyPolicy> _privacyPolicies = [];
        public IReadOnlyCollection<UserPrivacyPolicy> PrivacyPolicies => _privacyPolicies;
        public void ApprovePrivacyPolicy()
        {
            var policy = PrivacyPolicy;
            if (policy.IsApproved) return;
            policy.Approve();
        }

        //termsOfUses
        public UserTermsOfUse TermsOfUse => TermsOfUses.OrderBy(x => x.TermsOfUseId).Last();
        public bool IsTersmOfUseApproved => TermsOfUse.IsApproved;
        public readonly List<UserTermsOfUse> _termsOfUses = [];
        public IReadOnlyCollection<UserTermsOfUse> TermsOfUses => _termsOfUses;
        public void ApproveTermsOfUse()
        {
            var termsOfUse = TermsOfUse;
            if (termsOfUse.IsApproved) return;
            termsOfUse.Approve();
        }

        internal void Login(int policyId, int termsOfUseId)
        {
            if (_privacyPolicies.OrderBy(x => x.PravicyPolicyId).Last().PravicyPolicyId < policyId)
                _privacyPolicies.Add(UserPrivacyPolicy.Create(policyId));
            if (_termsOfUses.OrderBy(x => x.TermsOfUseId).Last().TermsOfUseId < termsOfUseId)
                _termsOfUses.Add(UserTermsOfUse.Create(termsOfUseId));
            SecurityStamp = GenerateSecurityStamp();
        }
        public void Logout() => SecurityStamp = GenerateSecurityStamp();

        //password
        public bool CheckPassword(Password password) => Password != null && HashComputer.Check(password.Value, Password.Hash);
        public void UpdatePassword(Password currentPassword, Password newPassword, Password newPasswordConfirm)
        {
            if (!newPassword.CompareValue(newPasswordConfirm))
                throw new PassowordAndPasswordConfirmationNotMatchException();

            if (!CheckPassword(currentPassword))
                throw new IncorrectPasswordException();

            Password = newPassword;
            UpdatedAt = DateTime.UtcNow;
        }

        //blocking
        public readonly List<Block> _blockers = [];
        public IReadOnlyCollection<Block> Blockers => _blockers;
        public Block Block(int blockerId)
        {
            if (_blockers.Any(x => x.BlockerId == blockerId))
                throw new UserIsAlreadyBlockedException();
            var block = Entities.Block.Create(blockerId);
            _blockers.Add(block);
            return block;
        }
        public void Unblock(int blockerId)
        {
            var index = _blockers.FindIndex(x => x.BlockerId == blockerId);
            if (index == -1) return;
            _blockers.RemoveAt(index);
        }
    }
}
