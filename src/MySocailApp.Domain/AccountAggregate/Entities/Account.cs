using Microsoft.AspNetCore.Identity;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using MySocailApp.Domain.AccountAggregate.ValueObjects;
using MySocailApp.Domain.AppUserAggregate.Entities;
using System.ComponentModel.DataAnnotations.Schema;

namespace MySocailApp.Domain.AccountAggregate.Entities
{
    public class Account : IdentityUser<int>, IAggregateRoot,IEntity
    {
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }

        public Account() { }
        public bool IsThirdPartyAuthenticated { get; private set; }
        internal void CreateByEmail(string email)
        {
            if (email == null)
                throw new EmailIsRequiredException();
            if(!ValueObjects.Email.IsValid(email))
                throw new InvalidEmailException();

            IsThirdPartyAuthenticated = false;
            Email = email;
            UserName = ValueObjects.Email.GenerateUserName(email);
            CreatedAt = DateTime.UtcNow;
            EmailConfirmationToken = VerificationToken.GenerateToken();

            AddDomainEvent(new AccountCreatedDominEvent(this));
        }
        internal void Create(string? email)//third party authentication;
        {
            IsThirdPartyAuthenticated = true;
            if(email == null)
                UserName = $"user_{BitConverter.ToInt64(Guid.NewGuid().ToByteArray(), 0)}";
            else
            {
                EmailConfirmed = true;
                UserName = ValueObjects.Email.GenerateUserName(email);
                Email = email;
            }
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new AccountCreatedDominEvent(this));
        }

        internal void UpdateUserName(string username)
        {
            UserName = username;
            UpdatedAt = DateTime.UtcNow;
        }
        internal void UpdateEmail(string email)
        {
            if(email == null) throw new EmailIsRequiredException();
            if(!ValueObjects.Email.IsValid(email)) throw new InvalidEmailException();

            Email = email;
            UpdatedAt = DateTime.UtcNow;
        }

        public bool IsRemoved { get; private set; }
        internal void Remove()
        {
            IsRemoved = true;
            AddDomainEvent(new AccountDeletedDomainEvent(this));
        }

        //Email verfication Token
        public VerificationToken? EmailConfirmationToken { get; private set; }
        public void UpdateEmailConfirmationToken()
        {
            if (EmailConfirmed)
                throw new EmailWasAlreadyConfirmedException();

            EmailConfirmationToken = VerificationToken.GenerateToken();
            AddDomainEvent(new EmailConfirmationtokenUpdatedDomainEvent(this));
        }
        public void ConfirmEmailByToken(string token)
        {
            if (!EmailConfirmationToken!.IsValid(token))
            {
                EmailConfirmationToken = EmailConfirmationToken.IncreaseNumberOfFailedAttemps();
                throw new InvalidVerificationTokenException();
            }
            else
            {
                EmailConfirmed = true;
                EmailConfirmationToken = null;
            }
        }

        public string? Language { get; private set; }
        public void UpdateLanguage(string cultere)
        {
            var lang = Languages.GetLanguage(cultere);
            if (!Languages.IsAcceptedLanguage(lang))
                throw new InvalidLanguageException();

            Language = lang;
            UpdatedAt = DateTime.UtcNow;
        }

        //Token
        [NotMapped]
        public Token Token { get; set; } = null!;

        public AppUser AppUser { get; } = null!;

        //IDomainEventsContainer;
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
        public void ClearEvents() => _events.Clear();
    }
}
