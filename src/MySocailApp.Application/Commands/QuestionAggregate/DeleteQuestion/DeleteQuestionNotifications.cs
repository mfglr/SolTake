using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;

namespace MySocailApp.Application.Commands.QuestionAggregate.DeleteQuestion
{
    public class DeleteQuestionNotifications(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<QuestionDeletedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(QuestionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var notifications = await _notificationWriteRepository.GetQuestionNotificationsAsync(notification.Question.Id,cancellationToken);
            _notificationWriteRepository.DeleteRange(notifications);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
