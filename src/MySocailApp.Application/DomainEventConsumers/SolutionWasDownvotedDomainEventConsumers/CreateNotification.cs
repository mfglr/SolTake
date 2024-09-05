using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionWasDownvotedDomainEventConsumers
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, INotificationConnectionReadRepository notificationConnectionReadRepository, IMapper mapper, ISolutionUserVoteQueryRepository solutionUserVoteQueryRepository, IHubContext<NotificationHub> notificationHub) : IDomainEventConsumer<SolutionWasDownvotedDomainEvent>
    {
        private readonly IMapper _mapper = mapper;
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;

        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly ISolutionUserVoteQueryRepository _solutionUserVoteQueryRepository = solutionUserVoteQueryRepository;

        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SolutionWasDownvotedDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = Notification.SolutionWasDownvotedNotification(notification.Solution.AppUserId, notification.Vote.AppUserId, notification.Solution.Id);
            await _notificationWriteRepository.CreateAsync(n,cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            var connection = await _notificationConnectionReadRepository.GetByIdAsync(notification.Solution.AppUserId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var vote = await _solutionUserVoteQueryRepository.GetSolutionVote(notification.Solution.AppUserId, notification.Vote.Id, cancellationToken);
            if (vote == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "getSolutionWasDownvotedNotification",
                    _mapper.Map<NotificationResponseDto>(n),
                    vote,
                    cancellationToken
                );

        }
    }
}
