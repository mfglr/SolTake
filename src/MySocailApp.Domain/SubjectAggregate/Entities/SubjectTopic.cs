namespace MySocailApp.Domain.SubjectAggregate.Entities
{
    public class SubjectTopic
    {
        public int SubjectId { get; private set; }
        public int TopicId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private SubjectTopic(int topicId) => TopicId = topicId;
        public static SubjectTopic Create(int topicId) => new(topicId) { CreatedAt = DateTime.UtcNow };
    }
}
