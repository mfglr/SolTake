using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Application.Queries.QuestionDomain;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.QuestionLikedNotificationCreatedDomainEventConsumers.NotificationConnectionAggreagate
{
    public class SendNotification(IHubContext<NotificationHub> notificationHub, INotificationConnectionReadRepository notificationConnectionReadRepository) : IDomainEventConsumer<QuestionLikedNotificationCreatedDomainEvent>
    {
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;

        public async Task Handle(QuestionLikedNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _notificationConnectionReadRepository.GetByIdAsync(notification.Notification.OwnerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "receiveNotification",
                    NotificationResponseDto.Create(notification),
                    QuestionUserLikeResponseDto.Create(notification),
                    cancellationToken
                );
        }
    }
}
