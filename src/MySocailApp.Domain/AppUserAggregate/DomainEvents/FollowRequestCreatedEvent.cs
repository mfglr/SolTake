using MySocailApp.Core;

namespace MySocailApp.Domain.AppUserAggregate.DomainEvents
{
    public record FollowRequestCreatedEvent : IDomainEvent
    {
        public DateTime Timestamp { get; private set; }
        public int RequesterId { get; private set; }
        public int RequestedId { get; private set; }

        public FollowRequestCreatedEvent(int requesterId, int requestedId)
        {
            Timestamp = DateTime.UtcNow;
            RequesterId = requesterId;
            RequestedId = requestedId;
        }
    }
}
