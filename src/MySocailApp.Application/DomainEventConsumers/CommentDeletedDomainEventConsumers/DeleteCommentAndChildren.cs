using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.DomainServices;

namespace MySocailApp.Application.DomainEventConsumers.CommentDeletedDomainEventConsumers
{
    public class DeleteCommentAndChildren(IUnitOfWork unitOfWork, CommentDeleterDomainService commentDeleter) : IDomainEventConsumer<CommentDeletedDomainEvent>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly CommentDeleterDomainService _commentDeleter = commentDeleter;

        public async Task Handle(CommentDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            await _commentDeleter.DeleteAsync(notification.Comment.Id, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
