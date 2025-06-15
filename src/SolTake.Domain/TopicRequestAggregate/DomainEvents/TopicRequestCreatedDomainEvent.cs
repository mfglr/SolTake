using SolTake.Core;
using SolTake.Domain.TopicRequestAggregate.Entities;

namespace SolTake.Domain.TopicRequestAggregate.DomainEvents
{
    public record TopicRequestCreatedDomainEvent(TopicRequest TopicRequest) : IDomainEvent;
}
