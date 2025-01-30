using AccountDomain.AccountAggregate.Entities;
using MySocailApp.Core;

namespace AccountDomain.AccountAggregate.DomainEvents
{
    public record EmailVerificationTokenUpdatedDomainEvent(Account Account) : IDomainEvent;
}
