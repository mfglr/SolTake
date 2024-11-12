using Microsoft.AspNetCore.Identity;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using System.ComponentModel.DataAnnotations.Schema;

namespace MySocailApp.Domain.AccountAggregate.Entities
{
    public class Account : IdentityUser<int>, IAggregateRoot, IEntity
    {
        public bool IsThirdPartyAuthenticated { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }

        public Account(string? email, bool isThirdPartyAuthenticated, string language)
        {
            if (!isThirdPartyAuthenticated)
            {
                if (string.IsNullOrEmpty(email))
                    throw new EmailIsRequiredException();
                if (!ValueObjects.Email.IsValid(email))
                    throw new InvalidEmailException();
            }

            Language = language;
            Email = email;
            IsThirdPartyAuthenticated = isThirdPartyAuthenticated;
            EmailConfirmed = isThirdPartyAuthenticated;
        }

        internal void Create()
        {
            if (!IsThirdPartyAuthenticated)
                _verificationTokens.Add(VerificationToken.Create());
            
            UserName =
                Email != null
                    ? ValueObjects.Email.GenerateUserName(Email)
                    : UserName = $"user_{BitConverter.ToInt64(Guid.NewGuid().ToByteArray(), 0)}";

            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new AccountCreatedDominEvent(this));
        }

        internal void UpdateUserName(string userName)
        {
            UserName = userName;
            UpdatedAt = DateTime.UtcNow;
        }
        internal void UpdateEmail(string email)
        {
            if(email == null) throw new EmailIsRequiredException();
            if(!ValueObjects.Email.IsValid(email)) throw new InvalidEmailException();

            _verificationTokens.Add(VerificationToken.Create());
            Email = email;
            UpdatedAt = DateTime.UtcNow;
            AddDomainEvent(new EmailVerificationTokenUpdatedDomainEvent(this));
        }

        public string Language { get; private set; }
        public void UpdateLanguage(string cultere)
        {
            var lang = Languages.GetLanguage(cultere);
            if (!Languages.IsValidLanguageCode(lang))
                throw new InvalidLanguageException();

            Language = lang;
            UpdatedAt = DateTime.UtcNow;
        }

        //Email verfication Tokens
        public bool IsEmailVerified => IsThirdPartyAuthenticated || VerificationTokens.OrderBy(x => x.Id).Last().IsVerified;
        public readonly List<VerificationToken> _verificationTokens = [];
        public IReadOnlyCollection<VerificationToken> VerificationTokens => _verificationTokens;
        public void UpdateEmailVerificationToken()
        {
            var sortedTokens = _verificationTokens.OrderByDescending(x => x.Id);
            if(sortedTokens.Count() > 10)
            {
                var tenthTokenFromTheStart = sortedTokens.ElementAt(9);
                if (DateTime.UtcNow <= tenthTokenFromTheStart.CreatedAt.AddHours(1))
                    throw new TooManyGeneratedVerificationTokenException();
            }
            var token = sortedTokens.First();
            if (token.IsVerified)
                throw new EmailAlreadyConfirmedException();
            _verificationTokens.Add(VerificationToken.Create());
            AddDomainEvent(new EmailVerificationTokenUpdatedDomainEvent(this));
        }
        public void VerifyEmailByToken(string token)
        {
            var verificationToken = _verificationTokens.OrderBy(x => x.Id).Last();
            verificationToken.Verify(token);
        }

        //privacyPolicies
        public AccountPrivacyPolicy PrivacyPolicy => PrivacyPolicies.OrderBy(x => x.PolicyId).Last();
        public bool IsPrivacyPolicyApproved => PrivacyPolicy.IsApproved;
        public readonly List<AccountPrivacyPolicy> _privacyPolicies = [];
        public IReadOnlyCollection<AccountPrivacyPolicy> PrivacyPolicies => _privacyPolicies;
        internal void AddPolicy(int policyId) => _privacyPolicies.Add(AccountPrivacyPolicy.Create(policyId));
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
        internal void AddTermOfUse(int termsOfUseId) => _termsOfUses.Add(AccountTermsOfUse.Create(termsOfUseId));
        public void ApproveTermsOfUse()
        {
            var termsOfUse = TermsOfUse;
            if (termsOfUse.IsApproved) return;
            termsOfUse.Approve();
        }

        //Tokens
        [NotMapped]
        public string AccessToken { get; internal set; } = null!;
        [NotMapped]
        public string RefreshToken { get; internal set; } = null!;

        //IDomainEventsContainer;
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
        public void ClearEvents() => _events.Clear();
    }
}
