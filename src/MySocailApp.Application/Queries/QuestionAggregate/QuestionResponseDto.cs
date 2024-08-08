using MySocailApp.Application.Queries.ExamAggregate;
using MySocailApp.Application.Queries.SubjectAggregate;

namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public class QuestionResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public int AppUserId { get; private set; }
        public string UserName { get; private set; } = null!;
        public string? Content { get; private set; }
        public bool IsLiked { get; private set; }
        public int NumberOfLikes { get; private set; }
        public int NumberOfSolutions { get; private set; }
        public int NumberOfComments { get; private set; }
        public bool IsOwner { get; private set; }
        public ExamResponseDto Exam { get; private set; } = null!;
        public SubjectResponseDto Subject { get; private set; } = null!;
        public List<QuestionTopicResponseDto> Topics { get; private set; } = null!;
        public List<QuestionImageResponseDto> Images { get; private set; } = null!;

        private QuestionResponseDto() { }
    }
}
