using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.NotificationAggregate.SolutionWasUpvotedDomainEventConsumers
{
    public class SendNotification(INotificationConnectionReadRepository notificationConnectionReadRepository, ISolutionUserVoteQueryRepository solutionUserVoteQueryRepository, IHubContext<NotificationHub> notificationHub, IMapper mapper) : IDomainEventConsumer<SolutionUpvotedNotificationCreatedDomainEvent>
    {
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly ISolutionUserVoteQueryRepository _solutionUserVoteQueryRepository = solutionUserVoteQueryRepository;
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly IMapper _mapper = mapper;

        public async Task Handle(SolutionUpvotedNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _notificationConnectionReadRepository.GetByIdAsync(notification.Notification.OwnerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var vote = await _solutionUserVoteQueryRepository.GetSolutionVote(notification.Notification.OwnerId, notification.VoteId, cancellationToken);
            if (vote == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "getSolutionWasUpvotedNotification",
                    _mapper.Map<NotificationResponseDto>(notification.Notification),
                    vote,
                    cancellationToken
                );
        }
    }
}
