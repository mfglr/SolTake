using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate;

namespace MySocailApp.Domain.ExamAggregate
{
    public class Exam()
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
