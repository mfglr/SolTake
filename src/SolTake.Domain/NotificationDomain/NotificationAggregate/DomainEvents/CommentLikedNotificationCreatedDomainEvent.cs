using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents
{
    public record CommentLikedNotificationCreatedDomainEvent(Notification Notification, int LikeId) : IDomainEvent;
}
