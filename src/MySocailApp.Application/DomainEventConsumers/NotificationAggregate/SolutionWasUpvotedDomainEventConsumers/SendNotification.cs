using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.NotificationAggregate.SolutionWasUpvotedDomainEventConsumers
{
    public class SendNotification(INotificationConnectionReadRepository notificationConnectionReadRepository, ISolutionUserVoteQueryRepository solutionUserVoteQueryRepository, IHubContext<NotificationHub> notificationHub, INotificationQueryRepository notificationQueryRepository) : IDomainEventConsumer<SolutionUpvotedNotificationCreatedDomainEvent>
    {
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly ISolutionUserVoteQueryRepository _solutionUserVoteQueryRepository = solutionUserVoteQueryRepository;
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationQueryRepository _notificationQueryRepository = notificationQueryRepository;

        public async Task Handle(SolutionUpvotedNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _notificationConnectionReadRepository.GetByIdAsync(notification.Notification.OwnerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var n = await _notificationQueryRepository.GetNotificationById(notification.Notification.Id, cancellationToken);
            if (n == null) return;

            var vote = await _solutionUserVoteQueryRepository.GetSolutionVote(notification.Notification.OwnerId, notification.VoteId, cancellationToken);
            if (vote == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync("getSolutionWasUpvotedNotification",n,vote,cancellationToken);
        }
    }
}
