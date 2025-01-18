using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.CommentLikedDomainEventConsumers.NotificationAggregate
{
    public class CreateCommentLikedNotification(ICommentReadRepository commentReadRepository, INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<CommentLikedDomainEvent>
    {
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(CommentLikedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = notification.Comment;
            Comment? parent = null;
            if (comment.ParentId != null)
            {
                parent = await _commentReadRepository.GetAsync((int)comment.ParentId, cancellationToken);
                if (parent == null) return;
            }

            var n = Notification
                .CommentLikedNotification(
                    notification.Comment.UserId,
                    comment.QuestionId ?? parent?.QuestionId,
                    comment.SolutionId ?? parent?.SolutionId,
                    comment.ParentId,
                    comment.Id,
                    notification.Like.UserId
                );

            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new CommentLikedNotificationCreatedDomainEvent(n, notification.Like.Id), cancellationToken);
        }
    }
}
