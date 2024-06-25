using MySocailApp.Core;
using MySocailApp.Domain.AppNotificationAggregate.DomainEvents;

namespace MySocailApp.Domain.AppNotificationAggregate
{
    public class AppNotification : IAggregateRoot, IDomainEventsContainer
    {
        public Guid Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatetAt { get; private set; }
        public string OwnerId { get; private set; } = null!;
        public string Data { get; private set; } = null!;
        public AppNotificationType Type { get; private set; }

        private AppNotification(){}
        
        public static AppNotification FollowCreatedNotification(string followerId,string followedId)
        {
            var notification = new AppNotification()
            {
                CreatedAt = DateTime.UtcNow,
                Type = AppNotificationType.FollowCreated,
                OwnerId = followedId,
                Data = followerId,
                State = AppNotificationState.Unviewed
            };
            notification.AddDomainEvent(new FollowNotificationCreatedEvent(notification));
            return notification;
        }

        public static AppNotification FollowRequestCreatedNotification(string requesterId,string requestedId)
        {
            var notification = new AppNotification()
            {
                CreatedAt = DateTime.UtcNow,
                Type = AppNotificationType.FollowRequestCreated,
                OwnerId = requestedId,
                Data = requesterId,
                State = AppNotificationState.Unviewed
            };
            notification.AddDomainEvent(new RequestNotificationCreatedEvent(requesterId, requestedId));
            return notification;
        }

        public AppNotificationState State { get; private set; }
        public DateTime? ViewedAt { get; private set; }
        public void MarkAsViewed()
        {
            State = AppNotificationState.Viewed;
            ViewedAt = DateTime.UtcNow;
        }

        //IDomainEventsContainer
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
    }
}
