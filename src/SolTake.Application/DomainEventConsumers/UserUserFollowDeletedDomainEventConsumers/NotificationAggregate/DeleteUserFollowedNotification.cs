using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.UserUserFollowAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserUserFollowDeletedDomainEventConsumers.NotificationAggregate
{
    public class DeleteUserFollowedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserUserFollowDeletedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserUserFollowDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = await _notificationWriteRepository.GetUserFollowedNotificationAsync(notification.UserUserFollow.FollowerId, notification.UserUserFollow.FollowedId, cancellationToken);
            if (n == null) return;

            _notificationWriteRepository.Delete(n);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
