using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.DomainEventConsumers.ReplyCommentCreatedDomainEventConsumers
{
    public class CreateNotification(ICommentReadRepository commentReadRepository, INotificationWriteRepository notficationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<ReplyCommentCreatedDomainEvent>
    {
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;
        private readonly INotificationWriteRepository _notficationWriteRepository = notficationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(ReplyCommentCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = notification.Comment;
            var parent = await _commentReadRepository.GetAsync(comment.Id,cancellationToken);
            if (parent == null) return;

            await _notficationWriteRepository.CreateAsync(
                Notification.ReplyCommentCreatedNotification(parent.AppUserId,comment.AppUserId,comment.Id, parent.QuestionId,parent.SolutionId,parent.Id),
                cancellationToken
            );
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
