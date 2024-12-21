using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents
{
    public record UserFollowedNotificationCreatedDomainEvent(Notification Notification, Follow Follow) : IDomainEvent;
}
