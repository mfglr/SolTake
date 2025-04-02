using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionDownvoteRemovedDomainEventConsumers.NotificationAggregate
{
    public class DeleteSolutionWasDownvotedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<SolutionDownvoteRemovedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SolutionDownvoteRemovedDomainEvent notification, CancellationToken cancellationToken)
        {
            //var n = await _notificationWriteRepository.GetSolutionWasDownvotedNotificationAsync(notification.Solution.Id, notification.Solution.UserId, cancellationToken);
            //if (n == null) return;

            //_notificationWriteRepository.Delete(n);
            //await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
