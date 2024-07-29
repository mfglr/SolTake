using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Domain.ExamAggregate.Entitities
{
    public class Exam() : IAggregateRoot
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public string ShortName { get; private set; }
        public string FullName { get; private set; }

        public void Create(string shortName, string fullName)
        {
            ShortName = shortName;
            FullName = fullName;
            CreatedAt = DateTime.UtcNow;
        }

        public IReadOnlyCollection<Subject> Subjects { get; }
        public IReadOnlyCollection<Question> Quesitons { get; }
    }
}
