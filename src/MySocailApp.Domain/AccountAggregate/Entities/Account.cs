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
            EmailConfirmationToken = EmailConfirmationToken.GenerateToken();

            AddDomainEvent(new AccountCreatedDominEvent(this));
        }
        internal void CreateByFaceBookLogin()
        {
            IsThirdPartyAuthenticated = true;
            UserName = $"user_{BitConverter.ToInt64(Guid.NewGuid().ToByteArray(), 0)}";
            CreatedAt = DateTime.UtcNow;

            AddDomainEvent(new AccountCreatedDominEvent(this));
        }
        internal void CreateByGoogle(string? email)
        {
            IsThirdPartyAuthenticated = true;
            if(email == null)
                UserName = $"user_{BitConverter.ToInt64(Guid.NewGuid().ToByteArray(), 0)}";
            else
            {
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

        //Email verfication Token
        public EmailConfirmationToken? EmailConfirmationToken { get; private set; } = null!;
        public void UpdateEmailConfirmationToken()
        {
            if (EmailConfirmed)
                throw new EmailWasAlreadyConfirmedException();

            EmailConfirmationToken = EmailConfirmationToken.GenerateToken();
            AddDomainEvent(new EmailConfirmationtokenUpdatedDomainEvent(this));
        }
        internal void ConfirmEmailByToken(string token)
        {
            if (!EmailConfirmationToken!.IsValid(token))
                EmailConfirmationToken = EmailConfirmationToken.IncreaseNumberOfFailedAttemps();
            else
                EmailConfirmed = true;
        }

        public AppUser AppUser { get; } = null!;

        //Token
        [NotMapped]
        public Token Token { get; set; } = null!;

        //IDomainEventsContainer;
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
        public void ClearEvents() => _events.Clear();
    }
}
