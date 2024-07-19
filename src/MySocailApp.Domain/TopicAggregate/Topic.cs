using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate;

namespace MySocailApp.Domain.TopicAggregate
{
    public class Topic()
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public int SubjectId { get; private set; }
        public string Name { get; private set; }

        public void Create(int subjectId,string name)
        {
            SubjectId = subjectId;
            Name = name;
            CreatedAt = DateTime.UtcNow;
        }

        public IReadOnlyCollection<QuestionTopic> Questions { get; }
        public Subject Subject { get; }
    }
}
