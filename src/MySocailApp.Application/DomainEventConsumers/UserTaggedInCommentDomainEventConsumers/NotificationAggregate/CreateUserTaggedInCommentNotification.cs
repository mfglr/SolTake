using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.UserTaggedInCommentDomainEventConsumers.NotificationAggregate
{
    public class CreateUserTaggedInCommentNotification(ICommentReadRepository commentReadRepository, INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<UserTaggedInCommentDomainEvent>
    {
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(UserTaggedInCommentDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = notification.Comment;
            Comment? parent = null;
            if (comment.ParentId != null)
            {
                parent = await _commentReadRepository.GetAsync((int)comment.ParentId, cancellationToken);
                if (parent == null) return;
            }
            var n = Notification
                .UserTaggedToCommentNotification(
                    notification.UserId,
                    notification.Comment.AppUserId,
                    notification.Comment.Id,
                    comment.QuestionId ?? parent?.QuestionId,
                    comment.SolutionId ?? parent?.SolutionId,
                    comment.ParentId
                );
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new UserTaggedInCommentNotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
