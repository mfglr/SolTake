namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.MakeUpvote
{
    public class MakeUpvoteCommandResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int SolutionId { get; private set; }
        public int UserId { get; private set; }

        private MakeUpvoteCommandResponseDto() { }
    }
}
