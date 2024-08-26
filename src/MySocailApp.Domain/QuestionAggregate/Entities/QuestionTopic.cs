using MySocailApp.Core;
using MySocailApp.Domain.TopicAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.Entities
{
    public class QuestionTopic : Entity
    {
        public int QuestionId { get; private set; }
        public int TopicId { get; private set; }

        private QuestionTopic(int topicId) => TopicId = topicId;
        public static QuestionTopic Create(int topicId) => new(topicId) { CreatedAt = DateTime.UtcNow };

        public Topic Topic { get; } = null!;
        public Question Question { get; } = null!;
    }
}
