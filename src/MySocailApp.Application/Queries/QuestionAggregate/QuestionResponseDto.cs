using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public class QuestionResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public int AppUserId { get; private set; }
        public string? Content { get; private set; }
        public Exam Exam { get; private set; } 
        public Subject Subject { get; private set; }
        public List<TopicResponseDto> Topics { get; private set; }
        public string UserName { get; private set; }
        public List<QuestionImageResponseDto> Images { get; private set; }

        private QuestionResponseDto() { }
    }
}
