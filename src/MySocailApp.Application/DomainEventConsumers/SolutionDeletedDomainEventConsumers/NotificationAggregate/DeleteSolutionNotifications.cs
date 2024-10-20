using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionDeletedDomainEventConsumers.NotificationAggregate
{
    public class DeleteSolutionNotifications(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<SolutionDeletedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SolutionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var notifications = await _notificationWriteRepository.GetSolutionNotificationsAsync(notification.Solution.Id, cancellationToken);
            _notificationWriteRepository.DeleteRange(notifications);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
