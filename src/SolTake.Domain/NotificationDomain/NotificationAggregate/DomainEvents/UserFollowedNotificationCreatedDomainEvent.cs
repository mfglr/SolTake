using SolTake.Domain.NotificationDomain.NotificationAggregate.Entities;
using SolTake.Domain.UserUserFollowAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.NotificationDomain.NotificationAggregate.DomainEvents
{
    public record UserFollowedNotificationCreatedDomainEvent(Notification Notification, UserUserFollow Follow) : IDomainEvent;
}
