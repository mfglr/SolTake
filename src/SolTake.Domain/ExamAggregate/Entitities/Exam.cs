using SolTake.Core;

namespace SolTake.Domain.ExamAggregate.Entitities
{
    public class Exam(string shortName, string fullName) : Entity, IAggregateRoot
    {
        public string ShortName { get; private set; } = shortName;
        public string FullName { get; private set; } = fullName;

        public void Create() => CreatedAt = DateTime.UtcNow;

    }
}
