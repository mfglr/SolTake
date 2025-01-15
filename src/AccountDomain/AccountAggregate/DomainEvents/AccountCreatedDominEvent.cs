using MySocailApp.Core;

namespace AccountDomain.DomainEvents
{
    public record AccountCreatedDominEvent(Entities.Account Account) : IDomainEvent;
}
