using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.NotificationAggregate.QuestionLikedNotificationCreatedDomainEventConsumers
{
    public class SendNotification(IHubContext<NotificationHub> notificationHub, INotificationConnectionReadRepository notificationConnectionReadRepository, IQuestionUserLikeQueryRepository questionUserLikeQueryRepository, INotificationQueryRepository notificationQueryRepository) : IDomainEventConsumer<QuestionLikedNotificationCreatedDomainEvent>
    {
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly IQuestionUserLikeQueryRepository _questionUserLikeQueryRepository = questionUserLikeQueryRepository;
        private readonly INotificationQueryRepository _notificationQueryRepository = notificationQueryRepository;

        public async Task Handle(QuestionLikedNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var ownerId = notification.Notification.OwnerId;

            var connection = await _notificationConnectionReadRepository.GetByIdAsync(ownerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var n = await _notificationQueryRepository.GetNotificationById(notification.Notification.Id, cancellationToken);

            var question = await _questionUserLikeQueryRepository.GetQuestionLikeAsync(ownerId, notification.LikeId, cancellationToken);
            if (question == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync("getQuestionLikedNotification",n,question,cancellationToken);
        }
    }
}
