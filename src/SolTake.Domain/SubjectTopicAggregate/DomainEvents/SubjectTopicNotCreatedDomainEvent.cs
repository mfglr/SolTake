using SolTake.Domain.TopicAggregate.Entities;
using SolTake.Domain.TopicRequestAggregate.Entities;

namespace SolTake.Domain.SubjectTopicAggregate.DomainEvents
{
    public record SubjectTopicNotCreatedDomainEvent(TopicRequest TopicRequest, Topic Topic);
}
