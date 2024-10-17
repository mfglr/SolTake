using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Entities;

namespace MySocailApp.Domain.NotificationAggregate.DomainEvents
{
    public record QuestionCommentNotificationCreatedDomainEvent(Notification Notification) : IDomainEvent;
}
