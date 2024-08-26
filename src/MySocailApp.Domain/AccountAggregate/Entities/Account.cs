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

        internal void Create(string email)
        {
            Email = email;
            UserName = ValueObjects.Email.GenerateUserName(email);
            CreatedAt = DateTime.UtcNow;
            EmailConfirmationToken = EmailConfirmationToken.GenerateToken();

            AddDomainEvent(new AccountCreatedDominEvent(this));
        }
        internal void UpdateUserName(string username)
        {
            UserName = username;
            UpdatedAt = DateTime.UtcNow;
        }
        internal void UpdateEmail(string email)
        {
            Email = email;
            UpdatedAt = DateTime.UtcNow;
        }

        //Email verfication Token
        public EmailConfirmationToken EmailConfirmationToken { get; private set; } = null!;
        public void UpdateEmailConfirmationToken()
        {
            if (EmailConfirmed)
                throw new EmailWasAlreadyConfirmedException();

            EmailConfirmationToken = EmailConfirmationToken.GenerateToken();
            AddDomainEvent(new EmailConfirmationtokenUpdatedDomainEvent(this));
        }
        internal void ConfirmEmailByToken(string token)
        {
            if (!EmailConfirmationToken.IsValid(token))
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
