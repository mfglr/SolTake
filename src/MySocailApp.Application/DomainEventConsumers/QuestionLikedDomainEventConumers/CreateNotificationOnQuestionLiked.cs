using MySocailApp.Application.Services;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.QuestionLikedDomainEventConumers
{
    public class CreateNotificationOnQuestionLiked(INotificationWriteRepository notificationRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<QuestionLikedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationRepository = notificationRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(QuestionLikedDomainEvent notification, CancellationToken cancellationToken)
        {
            var question = notification.Question;
            await _notificationRepository.CreateAsync(
                Notification.QuestionLikedNotification(question.AppUserId, question.Id, notification.LikerId),
                cancellationToken
            );
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
