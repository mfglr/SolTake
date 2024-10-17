using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Application.DomainEventConsumers.NotificationAggregate.SolutionMarkedAsIncorrectNotificationCreatedDomainEventConsumers
{
    public class SendNotification(IHubContext<NotificationHub> notificationHub, IMapper mapper, INotificationConnectionReadRepository notificationConnectionReadRepository) : IDomainEventConsumer<SolutionMarkedAsIncorrectNotificationCreatedDomainEvent>
    {
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task Handle(SolutionMarkedAsIncorrectNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _notificationConnectionReadRepository.GetByIdAsync(notification.Notification.OwnerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "getSolutionMarkAsIncorrectNotification",
                    _mapper.Map<NotificationResponseDto>(notification.Notification),
                    cancellationToken
                );
        }
    }
}
