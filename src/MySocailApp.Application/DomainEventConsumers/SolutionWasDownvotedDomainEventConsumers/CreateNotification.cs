using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionWasDownvotedDomainEventConsumers
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<SolutionWasDownvotedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SolutionWasDownvotedDomainEvent notification, CancellationToken cancellationToken)
        {
            await _notificationWriteRepository.CreateAsync(
               Notification.SolutionWasDownvotedNotification(notification.Solution.AppUserId, notification.VoterId, notification.Solution.Id),
               cancellationToken
           );
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
