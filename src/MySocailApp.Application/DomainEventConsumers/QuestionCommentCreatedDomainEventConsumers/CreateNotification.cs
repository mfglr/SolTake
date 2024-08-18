using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.DomainEventConsumers.QuestionCommentCreatedDomainEventConsumers
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IQuestionReadRepository questionReadRepository) : IDomainEventConsumer<QuestionCommentCreatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;

        public async Task Handle(QuestionCommentCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = notification.Comment;
            var question = await _questionReadRepository.GetAsync((int)comment.QuestionId!, cancellationToken);
            if (question == null) return;

            await _notificationWriteRepository.CreateAsync(
                Notification.QuestionCommentCreatedNotification(question.AppUserId, comment.AppUserId, comment.Id, (int)comment.QuestionId!), 
                cancellationToken
            );
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
