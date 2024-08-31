using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.SolutionAggregate.MakeUpvote
{
    public class MakeUpvoteCommandResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int SolutionId { get; private set; }
        public int AppUserId { get; private set; }
        public SolutionVoteType Type { get; private set; }

        private MakeUpvoteCommandResponseDto() { }
    }
}
