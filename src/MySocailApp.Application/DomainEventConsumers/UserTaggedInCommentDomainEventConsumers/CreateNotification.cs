using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.UserTaggedInCommentDomainEventConsumers
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, ICommentReadRepository commentReadRepsitory) : IDomainEventConsumer<UserTaggedInCommentDomainEvent>
    {
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
                if(parent == null) return;
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
        }
    }
}
