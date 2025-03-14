﻿using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.NotificationAggregate.SolutionMarkedAsCorrectNotificationCreatedDomainEventConsumers
{
    public class SendNotification(INotificationConnectionReadRepository notificationConnectionReadRepository, IHubContext<NotificationHub> notificationHub, INotificationQueryRepository notificationQueryRepository) : IDomainEventConsumer<SolutionMarkedAsCorrectNotificationCreatedDomainEvent>
    {
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationQueryRepository _notificationQueryRepository = notificationQueryRepository;

        public async Task Handle(SolutionMarkedAsCorrectNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var ownerId = notification.Notification.OwnerId;

            var connection = await _notificationConnectionReadRepository.GetByIdAsync(ownerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var n = await _notificationQueryRepository.GetNotificationById(notification.Notification.Id, cancellationToken);
            if(n == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync("getSolutionMarkAsCorrectNotification",n,cancellationToken);
        }
    }
}
