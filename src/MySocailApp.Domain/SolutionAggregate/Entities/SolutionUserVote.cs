using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Domain.SolutionAggregate.Entities
{
    public class SolutionUserVote : Entity
    {
        public int SolutionId { get; private set; }
        public int UserId { get; private set; }
        public SolutionVoteType Type { get; private set; }

        private SolutionUserVote(int userId) => UserId = userId;

        public static SolutionUserVote GenerateUpvote(int userId)
            => new(userId) { Type = SolutionVoteType.Upvote, CreatedAt = DateTime.UtcNow };

        public static SolutionUserVote GenerateDownvote(int userId)
            => new(userId) { Type = SolutionVoteType.Downvote, CreatedAt = DateTime.UtcNow };
    }
}
