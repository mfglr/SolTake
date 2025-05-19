using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.UserUserFollowAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents
{
    public record UserFollowedNotificationCreatedDomainEvent(Notification Notification, UserUserFollow Follow) : IDomainEvent;
}
