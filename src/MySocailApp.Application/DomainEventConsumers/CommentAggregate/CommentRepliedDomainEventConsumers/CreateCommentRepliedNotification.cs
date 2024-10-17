using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.CommentAggregate.CommentRepliedDomainEventConsumers
{
    public class CreateCommentRepliedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<CommentRepliedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;
        public async Task Handle(CommentRepliedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = notification.Comment;
            var repliedComment = notification.RepliedComment;
            var parentComment = notification.ParentComment;

            var n = Notification.CommentRepliedNotification(repliedComment.AppUserId, comment.AppUserId, comment.Id, parentComment.QuestionId, parentComment.SolutionId, parentComment.Id, repliedComment.Id);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new CommentRepliedNotificationCreatedDomainEvent(n), cancellationToken);
        }

    }
}
