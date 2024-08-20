using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.DomainEventConsumers.CommentRepliedDomainEventConsumers
{
    public class CreateNotification(INotificationWriteRepository notficationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<CommentRepliedDomainEvent>
    {
        private readonly INotificationWriteRepository _notficationWriteRepository = notficationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(CommentRepliedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = notification.Comment;
            var repliedComment = notification.RepliedComment;
            var parentComment = notification.ParentComment;

            await _notficationWriteRepository.CreateAsync(
                Notification.CommentRepliedNotification(repliedComment.AppUserId, comment.AppUserId, comment.Id, parentComment.QuestionId, parentComment.SolutionId, parentComment.Id, repliedComment.Id),
                cancellationToken
            );
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
