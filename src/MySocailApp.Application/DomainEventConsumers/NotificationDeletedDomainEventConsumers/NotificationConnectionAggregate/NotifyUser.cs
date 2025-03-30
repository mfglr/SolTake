using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.NotificationDeletedDomainEventConsumers.NotificationConnectionAggregate
{
    public class NotifyUser(IHubContext<NotificationHub> notificationHub, INotificationConnectionReadRepository notificationConnectionReadRepository) : IDomainEventConsumer<NotificationDeletedDomainEvent>
    {
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;

        public async Task Handle(NotificationDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _notificationConnectionReadRepository.GetByIdAsync(notification.Notification.OwnerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync("DeleteNotification", notification.Notification.Id);
        }
    }
}
