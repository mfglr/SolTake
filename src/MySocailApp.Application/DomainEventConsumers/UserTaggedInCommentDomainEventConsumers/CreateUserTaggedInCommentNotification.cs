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

namespace MySocailApp.Application.DomainEventConsumers.UserTaggedInCommentDomainEventConsumers
{
    public class CreateUserTaggedInCommentNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, ICommentReadRepository commentReadRepsitory, INotificationConnectionReadRepository notificationConnectionReadRepository, IHubContext<NotificationHub> notificationHub, IMapper mapper, ICommentQueryRepository commentQueryRepository) : IDomainEventConsumer<UserTaggedInCommentDomainEvent>
    {
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly IMapper _mapper = mapper;
        private readonly ICommentQueryRepository _commentQueryRepository = commentQueryRepository;

        private readonly ICommentReadRepository _commentReadRepsitory = commentReadRepsitory;
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserTaggedInCommentDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = notification.Comment;
            Comment? parent = null;
            if (comment.ParentId != null)
            {
                parent = await _commentReadRepsitory.GetAsync((int)comment.ParentId, cancellationToken);
                if (parent == null) return;
            }
            var n = Notification.UserTaggedToCommentNotification(
                notification.UserId,
                notification.Comment.AppUserId,
                notification.Comment.Id,
                comment.QuestionId ?? parent?.QuestionId,
                comment.SolutionId ?? parent?.SolutionId,
                comment.ParentId
            );
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            var connection = await _notificationConnectionReadRepository.GetByIdAsync(notification.UserId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var c = await _commentQueryRepository.GetByIdAsync(notification.UserId, notification.Comment.Id, cancellationToken);
            if (c == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "getUserTagInCommentNotification",
                    _mapper.Map<NotificationResponseDto>(n),
                    c,
                    cancellationToken
                );

        }
    }
}
