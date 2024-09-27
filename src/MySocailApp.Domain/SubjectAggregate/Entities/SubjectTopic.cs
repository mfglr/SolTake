using MySocailApp.Domain.TopicAggregate.Entities;

namespace MySocailApp.Domain.SubjectAggregate.Entities
{
    public class SubjectTopic(int subjectId, int topicId)
    {
        public int SubjectId { get; private set; } = subjectId;
        public int TopicId { get; private set; } = topicId;

        public Subject Subject { get; } = null!;
        public Topic Topic { get; } = null!;
    }
}
