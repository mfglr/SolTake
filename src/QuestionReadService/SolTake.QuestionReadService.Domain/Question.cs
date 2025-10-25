using SolTake.Core;
using SolTake.Core.Media;

namespace SolTake.QuestionReadService.Domain
{
    public class Question : IAggregateRoot
    {
        public Guid Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int Version { get; private set; }
        public int UserId { get; private set; }
        public string? Content { get; private set; }
        public int ExamId { get; private set; }
        public int SubjectId { get; private set; }
        public IEnumerable<string> Topics { get; private set; }
        public IEnumerable<Media> Media { get; private set; }
    }
}
