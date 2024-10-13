using MySocailApp.Core;

namespace MySocailApp.Domain.ExamAggregate.Entitities
{
    public class Exam : Entity, IAggregateRoot
    {
        public string ShortName { get; private set; }
        public string FullName { get; private set; }

        private Exam(string shortName, string fullName)
        {
            ShortName = shortName;
            FullName = fullName;
        }
        public static Exam Create(string shortName, string fullName) => new(shortName, fullName) { CreatedAt = DateTime.UtcNow };
    }
}
