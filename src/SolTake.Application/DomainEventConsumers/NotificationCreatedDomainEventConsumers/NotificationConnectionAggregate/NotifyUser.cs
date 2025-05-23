using Microsoft.AspNetCore.SignalR;
using SolTake.Application.Hubs;
using SolTake.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;
using SolTake.Core;

namespace SolTake.Application.DomainEventConsumers.NotificationCreatedDomainEventConsumers.NotificationConnectionAggregate
{
    public class NotifyUser(INotificationConnectionReadRepository notificationConnectionReadRepository, IHubContext<NotificationHub> notificationHub) : IDomainEventConsumer<NotificationCreatedDomainEvent>
    {
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;

        public async Task Handle(NotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _notificationConnectionReadRepository.GetByIdAsync(notification.Notification.OwnerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "receiveNotification",
                    notification.Notification,
                    cancellationToken
                );
        }
    }
}
