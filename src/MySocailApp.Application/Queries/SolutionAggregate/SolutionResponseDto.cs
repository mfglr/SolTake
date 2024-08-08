namespace MySocailApp.Application.Queries.SolutionAggregate
{
    public class SolutionResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public int QuestionId { get; private set; }
        public string UserName { get; private set; } = null!;
        public int AppUserId { get; private set; }
        public string? Content { get; private set; }
        public bool IsUpvoted { get; private set; }
        public int NumberOfUpvotes { get; private set; }
        public bool IsDownvoted { get; private set; }
        public int NumberOfDownvotes { get; private set; }
        public bool IsOwner { get; private set; }
        public bool BelongsToQuestionOfCurrentUser { get; private set; }
        public int NumberOfComments { get; private set; }
        public IReadOnlyCollection<SolutionImageResponseDto> Images { get; private set; } = null!;

        private SolutionResponseDto() { }
    }
}
