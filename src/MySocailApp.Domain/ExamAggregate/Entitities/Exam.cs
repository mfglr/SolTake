using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Domain.ExamAggregate.Entitities
{
    public class Exam(string shortName, string fullName) : IHasId, IAggregateRoot
    {
        public int Id { get; private set; }
        public string ShortName { get; private set; } = shortName;
        public string FullName { get; private set; } = fullName;

        public IReadOnlyCollection<Subject> Subjects { get; } = null!;
        public IReadOnlyCollection<Question> Quesitons { get; } = null!;
    }
}
