using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Domain.AccountAggregate.DomainEvents
{
    public record AccountCreatedDominEvent(Account Account) : IDomainEvent;
}
