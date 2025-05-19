using SolTake.Core;

namespace SolTake.Domain.AIModelAggregate.DomainEvents
{
    public record AIModelImageDeletedDomainEvent(Multimedia Image) : IDomainEvent;
}
