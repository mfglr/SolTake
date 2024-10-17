using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.CommentAggregate.QuestionCommentCreatedDomainEventConsumers
{
    public class CreateQuestionCommentCreatedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<QuestionCommentCreatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(QuestionCommentCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var ownerId = notification.Question.AppUserId;
            var userId = notification.Comment.AppUserId;
            var commentId = notification.Comment.Id;
            var questionId = notification.Question.Id;

            var n = Notification.QuestionCommentCreatedNotification(ownerId, userId, commentId, questionId);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new QuestionCommentNotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
