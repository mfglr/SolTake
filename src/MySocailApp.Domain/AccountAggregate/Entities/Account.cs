using Microsoft.AspNetCore.Identity;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Entities;
using System.ComponentModel.DataAnnotations.Schema;

namespace MySocailApp.Domain.AccountAggregate.Entities
{
    public class Account : IdentityUser<int>, IAggregateRoot, IEntity
    {
        public bool IsThirdPartyAuthenticated { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }

        public Account(string? email, bool isThirdPartyAuthenticated)
        {
            if (!isThirdPartyAuthenticated)
            {
                if (string.IsNullOrEmpty(email))
                    throw new EmailIsRequiredException();
                if (!ValueObjects.Email.IsValid(email))
                    throw new InvalidEmailException();
            }
            
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

        public bool IsRemoved { get; private set; }
        internal void Remove()
        {
            IsRemoved = true;
            AddDomainEvent(new AccountDeletedDomainEvent(this));
        }

        //Email verfication Tokens
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
        internal void VerifyEmailByToken(string token)
        {
            var verificationToken = _verificationTokens.OrderByDescending(x => x.Id).First();
            verificationToken.Verify(token);
        }

        public string? Language { get; private set; }
        public void UpdateLanguage(string cultere)
        {
            var lang = Languages.GetLanguage(cultere);
            if (!Languages.IsValidLanguageCode(lang))
                throw new InvalidLanguageException();

            Language = lang;
            UpdatedAt = DateTime.UtcNow;
        }

        //privacyPolicies
        public readonly List<AccountPrivacyPolicy> _privacyPolicies = [];
        public IReadOnlyCollection<AccountPrivacyPolicy> PrivacyPolicies => _privacyPolicies;
        internal void AddPolicy(int policyId) => _privacyPolicies.Add(AccountPrivacyPolicy.Create(policyId));
        public void ApprovePrivacyPolicy()
        {
            var policy = _privacyPolicies.OrderByDescending(x => x.PolicyId).FirstOrDefault(x => !x.IsApproved);
            if (policy == null) return;
            policy.Approve();
        }

        //termsOfUse
        public readonly List<AccountTermsOfUse> _termsOfUses = [];
        public IReadOnlyCollection<AccountTermsOfUse> TermsOfUses => _termsOfUses;
        internal void AddTermOfUse(int termsOfUseId) => _termsOfUses.Add(AccountTermsOfUse.Create(termsOfUseId));
        public void ApproveTermsOfUse()
        {
            var termsOfUse = _termsOfUses.OrderByDescending(x => x.TermsOfUseId).FirstOrDefault(x => !x.IsApproved);
            if (termsOfUse == null) return;
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
        
        //readonly navigator properties
        public AppUser AppUser { get; } = null!;
    }
}
