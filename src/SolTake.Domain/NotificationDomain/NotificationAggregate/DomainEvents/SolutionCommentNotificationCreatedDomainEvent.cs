using SolTake.Domain.NotificationDomain.NotificationAggregate.Entities;
using SolTake.Core;
using SolTake.Domain.CommentAggregate.Entities;

namespace SolTake.Domain.NotificationDomain.NotificationAggregate.DomainEvents
{
    public record SolutionCommentNotificationCreatedDomainEvent(Notification Notification, Comment Comment, Login Login) : IDomainEvent;
}
