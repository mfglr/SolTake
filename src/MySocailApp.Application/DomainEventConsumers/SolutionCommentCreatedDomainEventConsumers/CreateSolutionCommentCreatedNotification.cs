using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.SolutionCommentCreatedDomainEventConsumers
{
    public class CreateSolutionCommentCreatedNotification(ISolutionReadRepository solutionReadRepository, INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IHubContext<NotificationHub> notificationHub, INotificationConnectionReadRepository notificationConnectionReadRepository, IMapper mapper, ICommentQueryRepository commentQueryRepository) : IDomainEventConsumer<SolutionCommentCreatedDomainEvent>
    {
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly ICommentQueryRepository _commentQueryRepository = commentQueryRepository;
        private readonly IMapper _mapper = mapper;

        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SolutionCommentCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = notification.Comment;
            var solution = await _solutionReadRepository.GetAsync((int)comment.SolutionId!, cancellationToken);
            if (solution == null) return;

            var n = Notification.SolutionCommentCreatedNotification(solution.AppUserId, comment.AppUserId, comment.Id, solution.Id);
            await _notificationWriteRepository.CreateAsync(n,cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            var connection = await _notificationConnectionReadRepository.GetByIdAsync(solution.AppUserId, cancellationToken);
            if (connection == null) return;

            var c = await _commentQueryRepository.GetByIdAsync(solution.AppUserId, comment.Id, cancellationToken);

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "getSolutionCommentCreatedNotification",
                    _mapper.Map<NotificationResponseDto>(n),
                    c,
                    cancellationToken
                );
        }
    }
}
