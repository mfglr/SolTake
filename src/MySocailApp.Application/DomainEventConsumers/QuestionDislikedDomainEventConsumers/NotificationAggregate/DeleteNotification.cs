using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.QuestionDislikedDomainEventConsumers.NotificationAggregate
{
    public class DeleteNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<QuestionDislikedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(QuestionDislikedDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = await _notificationWriteRepository.GetQuestionLikedNotificationAsync(notification.Question.Id, notification.Question.AppUserId, cancellationToken);
            if (n == null) return;

            _notificationWriteRepository.Delete(n);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
