using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.NotificationAggregate.UserTaggedInCommentNotificationCreatedDomainEventConsumers
{
    public class SendNotification(INotificationConnectionReadRepository notificationConnectionReadRepository, ICommentQueryRepository commentQueryRepository, IHubContext<NotificationHub> notificationHub, INotificationQueryRepository notificationQueryRepository) : IDomainEventConsumer<UserTaggedInCommentNotificationCreatedDomainEvent>
    {
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly ICommentQueryRepository _commentQueryRepository = commentQueryRepository;
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationQueryRepository _notificationQueryRepository = notificationQueryRepository;

        public async Task Handle(UserTaggedInCommentNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var ownerId = notification.Notification.OwnerId;
            var commentId = (int)notification.Notification.CommentId!;

            var connection = await _notificationConnectionReadRepository.GetByIdAsync(ownerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var n = await _notificationQueryRepository.GetNotificationById(notification.Notification.Id,cancellationToken);
            if(n == null) return;

            var comment = await _commentQueryRepository.GetByIdAsync(ownerId, commentId, cancellationToken);
            if (comment == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync("getUserTagInCommentNotification",n,comment,cancellationToken);
        }
    }
}
