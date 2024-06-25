using MySocailApp.Core;

namespace MySocailApp.Domain.AppUserAggregate.DomainEvents
{
    public record FollowRequestCreatedEvent : IDomainEvent
    {
        public DateTime Timestamp { get; private set; }
        public string RequesterId { get; private set; }
        public string RequestedId { get; private set; }

        public FollowRequestCreatedEvent(string requesterId, string requestedId)
        {
            Timestamp = DateTime.UtcNow;
            RequesterId = requesterId;
            RequestedId = requestedId;
        }
    }
}
