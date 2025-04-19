using MySocailApp.Core;
using MySocailApp.Domain.FollowAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents
{
    public record UserFollowedNotificationCreatedDomainEvent(Notification Notification, Follow Follow) : IDomainEvent;
}
