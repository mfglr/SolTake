using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents
{
    public record SolutionCommentNotificationCreatedDomainEvent(Notification Notification, Comment Comment, Login Login) : IDomainEvent;
}
