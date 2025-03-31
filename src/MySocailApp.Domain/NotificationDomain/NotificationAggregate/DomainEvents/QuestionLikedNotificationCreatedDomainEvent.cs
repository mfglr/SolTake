using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents
{
    public record QuestionLikedNotificationCreatedDomainEvent(Notification Notification, QuestionUserLike Like, Login Login) : IDomainEvent;
}
