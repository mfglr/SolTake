using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents
{
    public record QuestionCommentNotificationCreatedDomainEvent(Notification Notification,Comment Comment,Login Login) : IDomainEvent;
}
