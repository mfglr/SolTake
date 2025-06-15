using SolTake.Core;
using SolTake.Domain.SubjectTopicAggregate.Entities;
using SolTake.Domain.TopicAggregate.Entities;
using SolTake.Domain.TopicRequestAggregate.Entities;

namespace SolTake.Domain.SubjectTopicAggregate.DomainEvents
{
    public record SubjectTopicCreatedDomainEvent(TopicRequest TopicRequest, Topic Topic, SubjectTopic SubjectTopic) : IDomainEvent;
}
