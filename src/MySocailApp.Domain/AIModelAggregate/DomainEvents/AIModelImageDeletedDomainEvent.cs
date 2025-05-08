using MySocailApp.Core;

namespace MySocailApp.Domain.AIModelAggregate.DomainEvents
{
    public record AIModelImageDeletedDomainEvent(Multimedia Image) : IDomainEvent;
}
