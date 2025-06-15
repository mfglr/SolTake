using SolTake.Core;

namespace SolTake.Domain.SubjectTopicAggregate.Entities
{
    public class SubjectTopic(int topicId, int subjectId) : Entity, IAggregateRoot
    {
        public int TopicId { get; private set; } = topicId;
        public int SubjectId { get; private set; } = subjectId;

        public void Create() => CreatedAt = DateTime.UtcNow;
    }
}
