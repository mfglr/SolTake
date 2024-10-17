using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Entities;

namespace MySocailApp.Domain.NotificationAggregate.DomainEvents
{
    public record QuestionLikedNotificationCreatedDomainEvent(Notification Notification,int LikeId) : IDomainEvent;
}
