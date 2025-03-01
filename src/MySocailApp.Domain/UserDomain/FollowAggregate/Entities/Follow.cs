using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.FollowAggregate.DomainEvents;

namespace MySocailApp.Domain.UserDomain.FollowAggregate.Entities
{
    public class Follow : Entity, IAggregateRoot
    {
        public int FollowerId { get; private set; }
        public int FollowedId { get; private set; }

        private Follow(int followerId, int followedId)
        {
            FollowerId = followerId;
            FollowedId = followedId;
        }
        public static Follow Create(int followerId, int followedId)
        {
            var follow = new Follow(followerId, followedId) {
                CreatedAt = DateTime.UtcNow
            };
            follow.AddDomainEvent(new UserFollowedDomainEvent(follow));
            return follow;
        }
    }
}
