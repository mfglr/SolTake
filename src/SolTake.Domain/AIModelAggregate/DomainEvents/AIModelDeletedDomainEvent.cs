using SolTake.Core;
using SolTake.Domain.AIModelAggregate.Entities;

namespace SolTake.Domain.AIModelAggregate.DomainEvents
{
    public record AIModelDeletedDomainEvent(AIModel AIModel) : IDomainEvent;
}
