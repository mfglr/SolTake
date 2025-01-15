using MySocailApp.Core;

namespace AccountDomain.DomainEvents
{
    public record AccountDeletedDomainEvent(Entities.Account Account) : IDomainEvent;
}
