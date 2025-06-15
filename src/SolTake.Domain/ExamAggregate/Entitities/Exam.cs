using SolTake.Core;
using SolTake.Domain.ExamAggregate.ValueObjects;

namespace SolTake.Domain.ExamAggregate.Entitities
{
    public class Exam : Entity, IAggregateRoot
    {
        public ExamInitialism Initialism { get; private set; }
        public ExamName Name { get; private set; }

        private Exam() { }

        public Exam(ExamInitialism initialism, ExamName name)
        {
            Initialism = initialism;
            Name = name;
        }

        public void Create() => CreatedAt = DateTime.UtcNow;

    }
}
