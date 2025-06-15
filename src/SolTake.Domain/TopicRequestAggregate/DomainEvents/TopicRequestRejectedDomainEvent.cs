using SolTake.Core;
using SolTake.Domain.TopicRequestAggregate.Entities;

namespace SolTake.Domain.TopicRequestAggregate.DomainEvents
{
    public record TopicRequestRejectedDomainEvent(TopicRequest TopicRequest) : IDomainEvent;
}
