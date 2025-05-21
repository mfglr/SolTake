using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using SolTake.Domain.QuestionAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.DeleteQuestion
{
    public class DeleteQuestionNotifications(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<QuestionDeletedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(QuestionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            //var notifications = await _notificationWriteRepository.GetQuestionNotificationsAsync(notification.Question.Id, cancellationToken);
            //_notificationWriteRepository.DeleteRange(notifications);
            //await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
