using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionUpvoteRemovedDomainEventConsumers
{
    public class DeleteSolutionWasUpvotedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<SolutionUpvoteRemovedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SolutionUpvoteRemovedDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = await _notificationWriteRepository.GetSolutionWasUpvotedNotificationAsync(notification.Solution.Id,notification.Solution.AppUserId,cancellationToken);
            if (n == null) return;

            _notificationWriteRepository.Delete(n);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
