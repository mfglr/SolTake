using AccountDomain.AccountAggregate.DomainEvents;
using AccountDomain.AccountAggregate.DomainServices;
using AccountDomain.AccountAggregate.Exceptions;
using AccountDomain.AccountAggregate.ValueObjects;
using MySocailApp.Core;
using System.ComponentModel.DataAnnotations.Schema;

namespace AccountDomain.AccountAggregate.Entities
{
    public class Account : Entity, IAggregateRoot
    {
        public UserName UserName { get; private set; }
        public Email Email { get; private set; }
        public Password? Password { get; private set; }
        public Language Language { get; private set; }
        public GoogleAccount? GoogleAccount { get; private set; }
        public string SecurityStamp { get; private set; }
        public AccountType AccountType { get; private set; }
        private readonly List<AccountRole> _roles = [];
        public IReadOnlyCollection<AccountRole> Roles => _roles;

        public bool IsSendableEmailVerificationMail => GoogleAccount == null && AccountType == AccountType.User;

        private static string GenerateSecurityStamp() => Guid.NewGuid().ToString().Replace("-", "").ToUpper();

        private Account() { }
        public Account(Email email, Password password, Password passwordConfirm, Language language)
        {
            if (!password.CompareValue(passwordConfirm))
                throw new PassowordAndPasswordConfirmationNotMatchException();

            AccountType = AccountType.User;
            Password = password;
            Email = email;
            UserName = email.GenerateUserName();
            Language = language;
            SecurityStamp = GenerateSecurityStamp();

        }
        public Account(GoogleAccount googleAccount, Language language)
        {
            AccountType = AccountType.User;
            GoogleAccount = googleAccount;
            Email = new(googleAccount.Email);
            UserName = Email.GenerateUserName();
            Language = language;
            SecurityStamp = GenerateSecurityStamp();
        }

        public static Account CreateAI(UserName userName)
        {
            var account = new Account()
            {
                UserName = userName,
                Email = Email.AIEmail(userName),
                Language = new(Languages.DEFAULT),
                SecurityStamp = GenerateSecurityStamp(),
                AccountType = AccountType.AI,
                CreatedAt = DateTime.UtcNow
            };
            account.AddDomainEvent(new AccountCreatedDominEvent(account));
            return account;
        }

        public static Account CreateChatGPT4O() => CreateAI(new("gpt-4o"));
        public static Account CreateChatGPT4OMini() => CreateAI(new("gpt-4o-mini"));
        public static Account CreateChatGPTO1() => CreateAI(new("o1"));
        public static Account CreateChatGPTO1Mini() => CreateAI(new("o1-mini"));
        public static Account CreateChatGPTO3Mini() => CreateAI(new("o3-mini"));

        internal void Create(int policyId, int termsOfUseId)
        {
            if (GoogleAccount == null)
                _verificationTokens.Add(EmailVerificationToken.Create());

            _roles.Add(new(1));
            _privacyPolicies.Add(AccountPrivacyPolicy.Create(policyId));
            _termsOfUses.Add(AccountTermsOfUse.Create(termsOfUseId));
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new AccountCreatedDominEvent(this));
        }

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
        public bool IsEmailVerified => AccountType == AccountType.AI || GoogleAccount != null || VerificationToken.IsVerified;
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
        public AccountPrivacyPolicy PrivacyPolicy => PrivacyPolicies.OrderBy(x => x.PolicyId).Last();
        public bool IsPrivacyPolicyApproved => PrivacyPolicy.IsApproved;
        public readonly List<AccountPrivacyPolicy> _privacyPolicies = [];
        public IReadOnlyCollection<AccountPrivacyPolicy> PrivacyPolicies => _privacyPolicies;
        public void ApprovePrivacyPolicy()
        {
            var policy = PrivacyPolicy;
            if (policy.IsApproved) return;
            policy.Approve();
        }

        //termsOfUses
        public AccountTermsOfUse TermsOfUse => TermsOfUses.OrderBy(x => x.TermsOfUseId).Last();
        public bool IsTersmOfUseApproved => TermsOfUse.IsApproved;
        public readonly List<AccountTermsOfUse> _termsOfUses = [];
        public IReadOnlyCollection<AccountTermsOfUse> TermsOfUses => _termsOfUses;
        public void ApproveTermsOfUse()
        {
            var termsOfUse = TermsOfUse;
            if (termsOfUse.IsApproved) return;
            termsOfUse.Approve();
        }

        internal void Login(int policyId, int termsOfUseId)
        {
            if (_privacyPolicies.OrderBy(x => x.PolicyId).Last().PolicyId < policyId)
                _privacyPolicies.Add(AccountPrivacyPolicy.Create(policyId));
            if (_termsOfUses.OrderBy(x => x.TermsOfUseId).Last().TermsOfUseId < termsOfUseId)
                _termsOfUses.Add(AccountTermsOfUse.Create(termsOfUseId));
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
                throw new AccountIsAlreadyBlockedException();
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

        //Tokens
        [NotMapped]
        public string AccessToken { get; internal set; } = null!;
        [NotMapped]
        public string RefreshToken { get; internal set; } = null!;
    }
}
