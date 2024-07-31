using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Domain.ExamAggregate.Entitities
{
    public class Exam() : IPaginableAggregateRoot
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public string ShortName { get; private set; } = null!;
        public string FullName { get; private set; } = null!;

        public void Create(string shortName, string fullName)
        {
            ShortName = shortName;
            FullName = fullName;
            CreatedAt = DateTime.UtcNow;
        }

        public IReadOnlyCollection<Subject> Subjects { get; } = null!;
        public IReadOnlyCollection<Question> Quesitons { get; } = null!;
    }
}
