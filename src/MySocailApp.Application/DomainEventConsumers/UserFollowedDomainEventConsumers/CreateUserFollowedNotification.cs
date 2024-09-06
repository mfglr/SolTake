using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Commands.UserAggregate.Follow;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.UserFollowedDomainEventConsumers
{
    public class CreateUserFollowedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, INotificationConnectionReadRepository notificationConnectionReadRepository, IHubContext<NotificationHub> notificationHub,IMapper mapper) : IDomainEventConsumer<UserFollowedDomainEvent>
    {
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly IMapper _mapper = mapper;

        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserFollowedDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = Notification.UserFollowedNotification(notification.Follow.FollowerId, notification.Follow.FollowedId);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            var connection = await _notificationConnectionReadRepository.GetByIdAsync(notification.Follow.FollowedId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "getUserFollowedNotification",
                    _mapper.Map<NotificationResponseDto>(n),
                    _mapper.Map<FollowCommandResponseDto>(notification.Follow),
                    cancellationToken
                );
        }
    }
}
