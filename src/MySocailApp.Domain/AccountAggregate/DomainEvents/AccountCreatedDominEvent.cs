using MySocailApp.Core;

namespace MySocailApp.Domain.AccountAggregate.DomainEvents
{
    public record AccountCreatedDominEvent(Account Account) : IDomainEvent;
}
