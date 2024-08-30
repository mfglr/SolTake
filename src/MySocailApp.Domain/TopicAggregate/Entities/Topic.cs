using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Domain.TopicAggregate.Entities
{
    public class Topic : Entity, IAggregateRoot
    {
        public int SubjectId { get; private set; }
        public string Name { get; private set; } = null!;

        public void Create(int subjectId, string name)
        {
            SubjectId = subjectId;
            Name = name;
            CreatedAt = DateTime.UtcNow;
        }

        public IReadOnlyCollection<QuestionTopic> Questions { get; } = null!;
        public Subject Subject { get; } = null!;
    }
}
