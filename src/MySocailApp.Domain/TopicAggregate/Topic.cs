using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Domain.TopicAggregate
{
    public class Topic(string name)
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public string Name { get; private set; } = name;

        public void Create() => CreatedAt = DateTime.UtcNow;

        public IReadOnlyCollection<QuestionTopic> Questions { get; }
    }
}
