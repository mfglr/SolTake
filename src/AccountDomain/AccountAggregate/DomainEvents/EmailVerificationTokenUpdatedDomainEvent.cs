using MySocailApp.Core;

namespace AccountDomain.DomainEvents
{
    public record EmailVerificationTokenUpdatedDomainEvent(Entities.Account Account) : IDomainEvent;
}
