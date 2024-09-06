using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.CommentLikedDomainEventConsumers
{
    public class CreateCommentLikedNotification(INotificationWriteRepository repository, IUnitOfWork unitOfWork, ICommentReadRepository commentReadRepository, IMapper mapper, INotificationConnectionReadRepository notificatinConnectionReadRepository, IHubContext<NotificationHub> notificationHub, ICommentUserLikeQueryRepository commentUserLikeQueryRepository) : IDomainEventConsumer<CommentLikedDomainEvent>
    {
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificatinConnectionReadRepository = notificatinConnectionReadRepository;
        private readonly IMapper _mapper = mapper;
        private readonly ICommentUserLikeQueryRepository _commentUserLikeQueryRepository = commentUserLikeQueryRepository;
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;
        private readonly INotificationWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(CommentLikedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = notification.Comment;
            Comment? parent = null;
            if (comment.ParentId != null)
            {
                parent = await _commentReadRepository.GetAsync((int)comment.ParentId, cancellationToken);
                if (parent == null) return;
            }
            var n = Notification.CommentLikedNotification(
                notification.Comment.AppUserId,
                comment.QuestionId ?? parent?.QuestionId,
                comment.SolutionId ?? parent?.SolutionId,
                comment.ParentId,
                comment.Id,
                notification.Like.AppUserId
            );
            await _repository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            var connection = await _notificatinConnectionReadRepository.GetByIdAsync(comment.AppUserId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;
            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "getCommentLikedNotification",
                    _mapper.Map<NotificationResponseDto>(n),
                    await _commentUserLikeQueryRepository.GetLikeAsync(notification.Like.Id,comment.AppUserId,cancellationToken),
                    cancellationToken
                );
        }
    }
}
