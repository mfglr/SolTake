using MySocailApp.Core;

namespace MySocailApp.Domain.AppUserAggregate.DomainEvents
{
    public record FollowCreatedEvent : IDomainEvent
    {
        public DateTime Timestamp { get; private set; }
        public int FollowerId { get; private set; }
        public int FollowedId { get; private set; }

        public FollowCreatedEvent(int followerId, int followedId)
        {
            Timestamp = DateTime.UtcNow;
            FollowerId = followerId;
            FollowedId = followedId;
        }
    }
}
