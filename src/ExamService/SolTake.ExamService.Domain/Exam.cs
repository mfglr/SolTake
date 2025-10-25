using SolTake.Core;

namespace SolTake.ExamService.Domain
{
    public class Exam : IAggregateRoot
    {
        public static readonly int MaxLenghtOfSubjects = 20;

        public Exam(ExamName name, ExamInitialism initialism, IEnumerable<ExamSubject> subjects)
        {
            if (subjects.Count() > MaxLenghtOfSubjects)
                throw new Exception("An exam can have up to 20 subjects.");

            Name = name;
            Initialism = initialism;
            Subjects = [.. subjects];
        }

        public int Version { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public ExamName Name { get; private set; }
        public ExamInitialism Initialism { get; private set; }
        public IReadOnlyCollection<ExamSubject> Subjects { get; private set; }

        internal void Create()
        {
            CreatedAt = DateTime.UtcNow;
            Version = 0;
        }

        public void AddSubject(ExamSubject subject)
        {
            if (Subjects.Any(x => x == subject))
                throw new Exception("The subject already belongs to the exam.");

            Subjects = [..Subjects, subject];
            Version++;
        }

        public void RemoveSubject(ExamSubject subject)
        {
            if (!Subjects.Any(x => x == subject))
                throw new Exception("Subject not found!");

            Subjects = [.. Subjects.Where(x => x != subject)];
            Version++;
        }
    }
}
