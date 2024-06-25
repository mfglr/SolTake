using Microsoft.AspNetCore.Identity;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Domain.AccountAggregate
{
    public class Account : IdentityUser<string>, IAggregateRoot, IRemovable, IDomainEventsContainer
    {
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }

        public Account(string id)
        {
            ArgumentNullException.ThrowIfNull(id);
            Id = id;
        }

        public void Create(string email)
        {
            Email = email;
            UserName = AccountAggregate.Email.GenerateUserName(email);
            CreatedAt = DateTime.UtcNow;
            IsRemoved = false;
            EmailVerificationToken = EmailConfirmationToken.GenerateToken();

            AddDomainEvent(new AccountCreatedDominEvent(this));
        }

        public void UpdateUserName(string username)
        {
            UserName = username;
            UpdatedAt = DateTime.UtcNow;
        }

        public void UpdateEmail(string email)
        {
            Email = email;
            UpdatedAt = DateTime.UtcNow;
        }

        //Email verfication Token
        public EmailConfirmationToken EmailVerificationToken { get; private set; }
        public void UpdateEmailConfirmationToken()
        {
            if(EmailConfirmed)
                throw new EmailWasAlreadyConfirmedException();

            EmailVerificationToken = EmailConfirmationToken.GenerateToken();
            AddDomainEvent(new EmailConfirmationtokenUpdatedDomainEvent(this));
        }
        public void ConfirmEmailByToken(string token)
        {
            if (!EmailVerificationToken.IsValid(token))
            {
                EmailVerificationToken.IncreaseNumberOfFailedAttemps();
                throw new InvalidEmailConfirmationTokenException();
            }
            EmailConfirmed = true;
        }

        //IRemovable
        public bool IsRemoved { get; private set; }
        public DateTime? RemovedAt { get; private set; }
        public void Remove()
        {
            IsRemoved = true;
            RemovedAt = DateTime.UtcNow;
        }
        public void Restore()
        {
            IsRemoved = false;
            RemovedAt = null;
        }
        
        //IDomainEventsContainer;
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
    }
}
