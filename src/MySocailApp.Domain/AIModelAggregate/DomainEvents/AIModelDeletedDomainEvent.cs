using MySocailApp.Core;
using MySocailApp.Domain.AIModelAggregate.Entities;

namespace MySocailApp.Domain.AIModelAggregate.DomainEvents
{
    public record AIModelDeletedDomainEvent(AIModel AIModel) : IDomainEvent;
}
