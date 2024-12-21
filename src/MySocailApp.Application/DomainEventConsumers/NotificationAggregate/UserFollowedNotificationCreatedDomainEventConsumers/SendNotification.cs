using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.NotificationAggregate.UserFollowedNotificationCreatedDomainEventConsumers
{
    public class SendNotification(INotificationConnectionReadRepository notificationConnectionReadRepository, IHubContext<NotificationHub> notificationHub, IFollowQueryRepository followQueryRepository, INotificationQueryRepository notificationQueryRepository) : IDomainEventConsumer<UserFollowedNotificationCreatedDomainEvent>
    {
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly IFollowQueryRepository _followQueryRepository = followQueryRepository;
        private readonly INotificationQueryRepository _notificationQueryRepository = notificationQueryRepository;

        public async Task Handle(UserFollowedNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var ownerId = notification.Notification.OwnerId;
            var followId = notification.Follow.Id;

            var connection = await _notificationConnectionReadRepository.GetByIdAsync(ownerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var n = await _notificationQueryRepository.GetNotificationById(notification.Notification.Id, cancellationToken);
            if(n == null) return;

            var follow = await _followQueryRepository.GetFollowerAsync(ownerId, followId, cancellationToken);
            if (follow == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync("getUserFollowedNotification",n,follow,cancellationToken);
        }
    }
}
