using SolTake.Core;
using SolTake.Domain.TopicAggregate.Entities;
using SolTake.Domain.TopicRequestAggregate.Entities;

namespace SolTake.Domain.TopicAggregate.DomainEvents
{
    public record TopicCreatedDomainEvent(TopicRequest TopicRequest, Topic Topic) : IDomainEvent;
}
