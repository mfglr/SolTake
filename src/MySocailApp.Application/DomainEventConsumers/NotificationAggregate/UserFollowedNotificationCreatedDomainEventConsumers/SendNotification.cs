using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Commands.UserAggregate.Follow;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.NotificationAggregate.UserFollowedNotificationCreatedDomainEventConsumers
{
    public class SendNotification(INotificationConnectionReadRepository notificationConnectionReadRepository, IHubContext<NotificationHub> notificationHub, IMapper mapper, IFollowQueryRepository followQueryRepository) : IDomainEventConsumer<UserFollowedNotificationCreatedDomainEvent>
    {

        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly IFollowQueryRepository _followQueryRepository = followQueryRepository;
        private readonly IMapper _mapper = mapper;

        public async Task Handle(UserFollowedNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var ownerId = notification.Notification.OwnerId;
            var followId = notification.Follow.Id;

            var connection = await _notificationConnectionReadRepository.GetByIdAsync(ownerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var follow = await _followQueryRepository.GetFollowerAsync(ownerId, followId, cancellationToken);
            if(follow == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "getUserFollowedNotification",
                    _mapper.Map<NotificationResponseDto>(notification.Notification),
                    follow,
                    cancellationToken
                );
        }
    }
}
