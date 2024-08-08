using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Domain.TopicAggregate.Entities
{
    public class Topic() : IPaginableAggregateRoot
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public int SubjectId { get; private set; }
        public string Name { get; private set; }

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
