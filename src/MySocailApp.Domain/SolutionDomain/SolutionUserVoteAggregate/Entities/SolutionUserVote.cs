using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Entities
{
    public class SolutionUserVote : Entity, IAggregateRoot
    {
        public int SolutionId { get; private set; }
        public int UserId { get; private set; }
        public SolutionVoteType Type { get; private set; }

        private SolutionUserVote(int solutionId, int userId)
        {
            SolutionId = solutionId;
            UserId = userId;
        }

        public static SolutionUserVote GenerateUpvote(int solutionId,int userId)
            => new(solutionId,userId) { Type = SolutionVoteType.Upvote, CreatedAt = DateTime.UtcNow };

        public static SolutionUserVote GenerateDownvote(int solutionId, int userId)
            => new(solutionId, userId) { Type = SolutionVoteType.Downvote, CreatedAt = DateTime.UtcNow };
    }
}
