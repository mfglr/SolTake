using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.NotificationAggregate.CommentLikedNotificationCreatedDomainEventConsumers
{
    public class SendNotification(INotificationConnectionReadRepository notificationConnectionReadRepository, ICommentUserLikeQueryRepository commentUserLikeQueryRepository, IHubContext<NotificationHub> notificationHub, IMapper mapper) : IDomainEventConsumer<CommentLikedNotificationCreatedDomainEvent>
    {
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly ICommentUserLikeQueryRepository _commentUserLikeQueryRepository = commentUserLikeQueryRepository;
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly IMapper _mapper = mapper;

        public async Task Handle(CommentLikedNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var ownerId = notification.Notification.OwnerId;
            var connection = await _notificationConnectionReadRepository.GetByIdAsync(ownerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var like = await _commentUserLikeQueryRepository.GetLikeAsync(notification.LikeId, ownerId, cancellationToken);
            if (like == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "getCommentLikedNotification",
                    _mapper.Map<NotificationResponseDto>(notification.Notification),
                    like,
                    cancellationToken
                );
        }
    }
}
