using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.NotificationAggregate.CommentRepliedNotificationCreatedDomainEventConsumers
{
    public class SendNotification(IHubContext<NotificationHub> notificationHub, ICommentQueryRepository commentQueryRepository, INotificationConnectionReadRepository notificationConnectionReadRepository, IMapper mapper) : IDomainEventConsumer<CommentRepliedNotificationCreatedDomainEvent>
    {
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly ICommentQueryRepository _commentQueryRepository = commentQueryRepository;
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task Handle(CommentRepliedNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var commentId = (int)notification.Notification.CommentId!;
            var ownerId = notification.Notification.OwnerId;

            var connection = await _notificationConnectionReadRepository.GetByIdAsync(ownerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var comment = await _commentQueryRepository.GetByIdAsync(ownerId, commentId, cancellationToken);
            if (comment == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "getCommentRepliedNotification",
                    _mapper.Map<NotificationResponseDto>(notification.Notification),
                    comment,
                    cancellationToken
                );
        }
    }
}
