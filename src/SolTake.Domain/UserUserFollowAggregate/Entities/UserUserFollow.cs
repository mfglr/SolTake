using MySocailApp.Domain.UserUserFollowAggregate.DomainEvents;
using SolTake.Domain.UserAggregate.Entities;
using SolTake.Domain.UserAggregate.Exceptions;
using SolTake.Core;

namespace MySocailApp.Domain.UserUserFollowAggregate.Entities
{
    public class UserUserFollow : Entity, IAggregateRoot
    {
        public int FollowerId { get; private set; }
        public int FollowedId { get; private set; }

        public UserUserFollow(int followerId, int followedId)
        {
            if (followerId == followedId)
                throw new PermissionDeniedToFollowYourselfException();

            FollowerId = followerId;
            FollowedId = followedId;
        }

        internal void Create(User followed, Login login)
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new UserUserFollowCreatedDomainEvent(followed, this, login));
        }
    }
}
