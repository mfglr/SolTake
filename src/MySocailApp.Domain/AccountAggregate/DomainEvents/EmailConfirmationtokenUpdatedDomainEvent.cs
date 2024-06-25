using MySocailApp.Core;

namespace MySocailApp.Domain.AccountAggregate.DomainEvents
{
    public record EmailConfirmationtokenUpdatedDomainEvent(Account Account) : IDomainEvent;
}
