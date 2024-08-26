using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Domain.SolutionAggregate.Entities
{
    public class SolutionUserVote : Entity
    {
        public int SolutionId { get; private set; }
        public int AppUserId { get; private set; }
        public SolutionVoteType Type { get; private set; }

        private SolutionUserVote(int appUserId) => AppUserId = appUserId;

        public static SolutionUserVote GenerateUpvote(int appUserId)
            => new(appUserId) { Type = SolutionVoteType.Upvote, CreatedAt = DateTime.UtcNow };

        public static SolutionUserVote GenerateDownvote(int appUserId)
            => new(appUserId) { Type = SolutionVoteType.Downvote, CreatedAt = DateTime.UtcNow };

        //readonly navigator properties
        public Solution Solution { get; } = null!;
        public AppUser AppUser { get; } = null!;
    }
}
