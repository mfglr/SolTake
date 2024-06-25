using MySocailApp.Core;

namespace MySocailApp.Domain.AppNotificationAggregate.DomainEvents
{
    public class RequestNotificationCreatedEvent : IDomainEvent
    {
        public DateTime Timestamp { get; private set; }
        public string RequesterId { get; private set; }
        public string RequestedId { get; private set; }

        public RequestNotificationCreatedEvent(string requesterId, string requestedId)
        {
            Timestamp = DateTime.UtcNow;
            RequesterId = requesterId;
            RequestedId = requestedId;
        }
    }
}
