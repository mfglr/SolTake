using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Domain.SolutionAggregate.Entities
{
    public class SolutionUserVote
    {
        public DateTime CreatedAt { get; private set; }
        public int SolutionId { get; private set; }
        public int AppUserId { get; private set; }
        public SolutionVoteType Type { get; private set; }

        private SolutionUserVote(int solutionId, int appUserId)
        {
            SolutionId = solutionId;
            AppUserId = appUserId;
        }

        public static SolutionUserVote GenerateUpvote(int solutionId, int appUserId)
            => new(solutionId, appUserId) { Type = SolutionVoteType.Upvote, CreatedAt = DateTime.UtcNow };

        public static SolutionUserVote GenerateDownvote(int solutionId, int appUserId)
            => new(solutionId, appUserId) { Type = SolutionVoteType.Downvote, CreatedAt = DateTime.UtcNow };

        //readonly navigator properties
        public Solution Solution { get; } = null!;
        public AppUser AppUser { get; } = null!;
    }
}
