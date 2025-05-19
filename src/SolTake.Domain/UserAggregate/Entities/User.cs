using MySocailApp.Domain.UserAggregate.DomainServices;
using MySocailApp.Domain.UserAggregate.ValueObjects;
using MySocailApp.Domain.UserAggregate.DomainEvents;
using MySocailApp.Domain.UserAggregate.Exceptions;
using SolTake.Core;
using SolTake.Domain.UserAggregate.ValueObjects;

namespace MySocailApp.Domain.UserAggregate.Entities
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
        public string AccessToken { get; internal set; } = null!; //not mapped

        private readonly List<RefreshToken> _refreshTokens = [];
        public IReadOnlyCollection<RefreshToken> RefreshTokens => _refreshTokens;

        private static string GenerateSecurityStamp() => Guid.NewGuid().ToString().Replace("-", "").ToUpper();

        private User() { }
        public User(Email email, Password password, Language language)
        {
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

        public bool IsValidRefreshToken(string token) => _refreshTokens.Any(x => x.Check(token));

        internal void Create(int policyId, int termsOfUseId)
        {
            if (GoogleAccount == null)
                _verificationTokens.Add(EmailVerificationToken.Create());

            _roles.Add(new((int)ValueObjects.Roles.user));
            _privacyPolicies.Add(UserPrivacyPolicy.Create(policyId));
            _termsOfUses.Add(UserTermsOfUse.Create(termsOfUseId));
            CreatedAt = DateTime.UtcNow;
            _refreshTokens.Add(RefreshToken.CreateRandom());
            AddDomainEvent(new UserCreatedDomainEvent(this));
        }

        public void RemoveRefreshTokens(string token) => _refreshTokens.RemoveAll(x => !x.Check(token));

        internal void UpdateImage(Multimedia image)
        {
            ArgumentNullException.ThrowIfNull(image);

            if (Image != null)
                AddDomainEvent(new MediasDeletedDomainEvent([Image]));

            Image = image;
            UpdatedAt = DateTime.UtcNow;
            _refreshTokens.Add(RefreshToken.CreateRandom());
            AddDomainEvent(new ProfileImageUpdatedDomainEvent(this));
        }
        internal void RemoveImage()
        {
            if (Image == null)
                throw new UserImageIsNotAvailableException();
            AddDomainEvent(new MediasDeletedDomainEvent([Image]));

            Image = null;
            UpdatedAt = DateTime.UtcNow;
            _refreshTokens.Add(RefreshToken.CreateRandom());
            AddDomainEvent(new ProfileImageUpdatedDomainEvent(this));
        }
        internal void UpdateName(string name)
        {
            Name = name;
            UpdatedAt = DateTime.UtcNow;
            _refreshTokens.Add(RefreshToken.CreateRandom());
            AddDomainEvent(new NameUpdatedDomainEvent(this));
        }
        public void UpdateBiography(Biography biography)
        {
            Biography = biography;
            UpdatedAt = DateTime.UtcNow;
        }
        internal void UpdateUserName(UserName userName)
        {
            UserName = userName;
            UpdatedAt = DateTime.UtcNow;
            _refreshTokens.Add(RefreshToken.CreateRandom());
            AddDomainEvent(new UserNameUpdatedDomainEvent(this));
        }
        internal void UpdateEmail(Email email)
        {
            _verificationTokens.Add(EmailVerificationToken.Create());
            Email = email;
            UpdatedAt = DateTime.UtcNow;
            _refreshTokens.Add(RefreshToken.CreateRandom());
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
            _refreshTokens.Add(RefreshToken.CreateRandom());
            SecurityStamp = GenerateSecurityStamp();
        }
        public void Logout() => _refreshTokens.Clear();

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
    }
}
