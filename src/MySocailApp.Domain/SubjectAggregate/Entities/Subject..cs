using MySocailApp.Core;
using MySocailApp.Domain.ExamAggregate.Entitities;
using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.SubjectAggregate.Entities
{
    public class Subject(int examId, string name) : IHasId, IAggregateRoot
    {
        public int Id { get; private set; }
        public int ExamId { get; private set; } = examId;
        public string Name { get; private set; } = name;

        public IReadOnlyCollection<SubjectTopic> Topics { get; } = null!;
        public IReadOnlyCollection<Question> Quesitons { get; } = null!;
        public Exam Exam { get; } = null!;
    }
}
