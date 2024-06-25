using MySocailApp.Core;

namespace MySocailApp.Domain.AppUserAggregate.DomainEvents
{
    public record FollowCreatedEvent : IDomainEvent
    {
        public DateTime Timestamp { get; private set; }
        public string FollowerId { get; private set; }
        public string FollowedId { get; private set; }

        public FollowCreatedEvent(string followerId, string followedId)
        {
            Timestamp = DateTime.UtcNow;
            FollowerId = followerId;
            FollowedId = followedId;
        }
    }
}
