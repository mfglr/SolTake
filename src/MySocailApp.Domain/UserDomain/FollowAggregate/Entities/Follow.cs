using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.FollowAggregate.DomainEvents;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Domain.UserDomain.FollowAggregate.Entities
{
    public class Follow : Entity, IAggregateRoot
    {
        public int FollowerId { get; private set; }
        public int FollowedId { get; private set; }

        public Follow(int followerId, int followedId)
        {
            if(followerId == followedId)
                throw new PermissionDeniedToFollowYourselfException();

            FollowerId = followerId;
            FollowedId = followedId;
        }

        internal void Create(User followed, Login login)
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new UserFollowedDomainEvent(followed, this, login));
        }
    }
}
