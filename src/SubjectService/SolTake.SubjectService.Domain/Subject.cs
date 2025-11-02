using SolTake.Core;

namespace SolTake.SubjectService.Domain
{
    public class Subject(SubjectName name) : IAggregateRoot
    {
        public Guid Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int Version { get; private set; }
        public SubjectName Name { get; private set; } = name;

        internal void Create()
        {
            Id = Guid.NewGuid();
            CreatedAt = DateTime.UtcNow;
            Version = 0;
        }
    }
}
