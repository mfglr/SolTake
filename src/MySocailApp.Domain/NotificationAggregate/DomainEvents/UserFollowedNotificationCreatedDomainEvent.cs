using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Domain.NotificationAggregate.DomainEvents
{
    public record UserFollowedNotificationCreatedDomainEvent(Notification Notification,Follow Follow) : IDomainEvent;
}
