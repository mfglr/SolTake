using MySocailApp.Core;

namespace MySocailApp.Domain.AppNotificationAggregate.DomainEvents
{
    public record FollowNotificationCreatedEvent(AppNotification AppNotification) : IDomainEvent;
}
