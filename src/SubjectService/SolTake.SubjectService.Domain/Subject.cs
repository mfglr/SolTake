using SolTake.Core;

namespace SolTake.SubjectService.Domain
{
    public class Subject(SubjectName name) : IAggregateRoot
    {
        public DateTime CreatedAt { get; private set; }
        public int Version { get; private set; }
        public SubjectName Name { get; private set; } = name;

        internal void Create()
        {
            CreatedAt = DateTime.UtcNow;
            Version = 0;
        }
    }
}
