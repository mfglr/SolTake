using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.QuestionCommentCreatedDomainEventConsumers.NotificationAggregate
{
    public class CreateQuestionCommentCreatedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<QuestionCommentCreatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(QuestionCommentCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var ownerId = notification.Question.UserId;
            var userId = notification.Comment.UserId;
            var commentId = notification.Comment.Id;
            var questionId = notification.Question.Id;

            var n = Notification.QuestionCommentCreatedNotification(ownerId, userId, commentId, questionId);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new QuestionCommentNotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
