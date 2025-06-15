using SolTake.Core;

namespace SolTake.Domain.SubjectAggregate.Entities
{
    public class Subject(int examId, string name) : Entity, IAggregateRoot
    {
        public int ExamId { get; private set; } = examId;
        public string Name { get; private set; } = name;
        
        public void Create() => CreatedAt = DateTime.UtcNow;
    }
}
