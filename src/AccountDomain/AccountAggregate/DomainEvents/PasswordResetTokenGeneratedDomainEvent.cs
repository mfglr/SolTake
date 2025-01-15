using MySocailApp.Core;

namespace AccountDomain.DomainEvents
{
    public record PasswordResetTokenGeneratedDomainEvent(Entities.Account Account) : IDomainEvent;
}
