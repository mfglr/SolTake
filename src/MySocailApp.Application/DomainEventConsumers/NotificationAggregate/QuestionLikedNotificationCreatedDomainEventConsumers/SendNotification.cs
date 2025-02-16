using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;

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

            var like = await _questionUserLikeQueryRepository.GetQuestionLikeAsync(notification.LikeId, cancellationToken);
            if (like == null) return;
            
            var n = await _notificationQueryRepository.GetNotificationById(notification.Notification.Id, cancellationToken);

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync("getQuestionLikedNotification", n, like, cancellationToken);
        }
    }
}
