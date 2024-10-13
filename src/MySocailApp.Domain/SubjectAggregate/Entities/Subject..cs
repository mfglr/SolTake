using MySocailApp.Core;

namespace MySocailApp.Domain.SubjectAggregate.Entities
{
    public class Subject : Entity, IAggregateRoot
    {
        public string Name { get; private set; }
        public int ExamId { get; private set; }

        private Subject(int examId, string name)
        {
            ExamId = examId;
            Name = name;
        }
        
        public static Subject Create(int examId, string name) => new(examId, name) { CreatedAt = DateTime.UtcNow };
        
        public readonly List<SubjectTopic> _topics = [];
        public IReadOnlyCollection<SubjectTopic> Topics => _topics;
    }
}
