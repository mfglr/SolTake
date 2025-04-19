using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.UserUserFollowAggregate.Entities;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents
{
    public record UserFollowedNotificationCreatedDomainEvent(Notification Notification, UserUserFollow Follow) : IDomainEvent;
}
