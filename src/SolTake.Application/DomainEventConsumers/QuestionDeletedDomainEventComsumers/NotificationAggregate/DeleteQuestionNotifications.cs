using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.QuestionDeletedDomainEventComsumers.NotificationAggregate
{
    public class DeleteQuestionNotifications(INotificationWriteRepository notficationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<QuestionDeletedDomainEvent>
    {
        private readonly INotificationWriteRepository _notficationWriteRepository = notficationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(QuestionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            //var notifications = await _notficationWriteRepository.GetQuestionNotificationsAsync(notification.Question.Id, cancellationToken);
            //_notficationWriteRepository.DeleteRange(notifications);
            //await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
