using MySocailApp.Core;

namespace MySocailApp.Domain.AppUserAggregate.Entities
{
    public class Follow : Entity
    {
        public int FollowerId { get; private set; }
        public int FollowedId { get; private set; }

        private Follow(int followerId, int followedId)
        {
            FollowerId = followerId;
            FollowedId = followedId;
        }

        public static Follow Create(int followerId, int followedId) => new (followerId, followedId){CreatedAt = DateTime.UtcNow};
    }
}
