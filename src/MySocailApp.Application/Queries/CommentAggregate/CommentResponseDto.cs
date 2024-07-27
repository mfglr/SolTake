namespace MySocailApp.Application.Queries.CommentAggregate
{
    public class CommentResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }
        public string UserName { get; private set; }
        public int AppUserId { get; private set; }
        public bool IsEdited { get; private set; }
        public string Content { get; private set; }
        public bool IsLiked { get; private set; }
        public int NumberOfLikes { get; private set; }
        public int NumberOfReplies { get; private set; }
        public int? QuestionId { get; private set; }
        public int? SolutionId { get; private set; }
        public int? ParentId { get; private set; }

        private CommentResponseDto() { }
    }
}
