using MySocailApp.Core;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.DomainEvents
{
    public record AccountDeletedDomainEvent(Account Account) : IDomainEvent;
}
