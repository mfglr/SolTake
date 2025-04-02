using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionUpvoteRemovedDomainEventConsumers.NotificationAggregate
{
    public class DeleteSolutionUpvotedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<SolutionUpvoteRemovedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SolutionUpvoteRemovedDomainEvent notification, CancellationToken cancellationToken)
        {
            //var n = await _notificationWriteRepository.GetSolutionWasUpvotedNotificationAsync(notification.Solution.Id, notification.Solution.UserId, cancellationToken);
            //if (n == null) return;

            //_notificationWriteRepository.Delete(n);
            //await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
