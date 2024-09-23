using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.CommentAggregate.CommentDeletedDomainEventConsumers
{
    public class DeleteComment(IUnitOfWork unitOfWork, ICommentWriteRepository commentWriteRepository, INotificationWriteRepository notificationWriteRepository) : IDomainEventConsumer<CommentDeletedDomainEvent>
    {
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(CommentDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = await _commentWriteRepository.GetCommentWithAllByIdAsync(notification.CommentId, cancellationToken);
            if (comment == null) return;

            comment.SetRepliedIdsAsNull();
            _notificationWriteRepository.DeleteRange(comment.Notifications);
            _commentWriteRepository.DeleteRange(comment.Children);
            _commentWriteRepository.Delete(comment);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
