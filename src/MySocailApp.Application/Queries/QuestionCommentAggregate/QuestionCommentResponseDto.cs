namespace MySocailApp.Application.Queries.QuestionCommentAggregate
{
    public class QuestionCommentResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; }
        public string UserName { get; private set; }
        public string Content { get; private set; }
        public int NumberOfLikes { get; private set; }
        private QuestionCommentResponseDto() { }
    }
}
