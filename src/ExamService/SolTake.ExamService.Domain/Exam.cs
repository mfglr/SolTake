using SolTake.Core;

namespace SolTake.ExamService.Domain
{
    public class Exam : IAggregateRoot
    {
        public static readonly int MaxCountOfSubjects = 100;

        public Guid Id { get; private set; }
        public int Version { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public Country Country { get; private set; }
        public ExamName Name { get; private set; }
        public ExamInitialism Initialism { get; private set; }
        public List<Guid> Subjects { get; private set; }

        public Exam(Country country, ExamName name, ExamInitialism initialism, IEnumerable<Guid> subjects)
        {
            if (subjects.Count() > MaxCountOfSubjects)
                throw new Exception($"An exam can have up to {MaxCountOfSubjects} subjects.");

            Country = country;
            Name = name;
            Initialism = initialism;
            Subjects = [.. subjects];
        }

        internal void Create()
        {
            Id = Guid.NewGuid();
            CreatedAt = DateTime.UtcNow;
            Version = 0;
        }
    }
}
