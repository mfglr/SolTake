using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.NotificationAggregate.SolutionMarkedAsIncorrectNotificationCreatedDomainEventConsumers
{
    public class SendNotification(IHubContext<NotificationHub> notificationHub, INotificationConnectionReadRepository notificationConnectionReadRepository, INotificationQueryRepository notificationQueryRepository) : IDomainEventConsumer<SolutionMarkedAsIncorrectNotificationCreatedDomainEvent>
    {
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly INotificationQueryRepository _notificationQueryRepository = notificationQueryRepository;

        public async Task Handle(SolutionMarkedAsIncorrectNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _notificationConnectionReadRepository.GetByIdAsync(notification.Notification.OwnerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var n = await _notificationQueryRepository.GetNotificationById(notification.Notification.Id, cancellationToken);
            if (n == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync("getSolutionMarkAsIncorrectNotification",n,cancellationToken);
        }
    }
}
