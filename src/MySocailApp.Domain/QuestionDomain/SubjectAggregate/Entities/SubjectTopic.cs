namespace MySocailApp.Domain.QuestionDomain.SubjectAggregate.Entities
{
    public class SubjectTopic
    {
        public int SubjectId { get; private set; }
        public int TopicId { get; private set; }

        internal SubjectTopic(int topicId) => TopicId = topicId;
    }
}
