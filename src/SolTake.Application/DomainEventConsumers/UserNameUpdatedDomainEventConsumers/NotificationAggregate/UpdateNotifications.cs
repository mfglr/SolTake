using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using SolTake.Domain.UserAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserNameUpdatedDomainEventConsumers.NotificationAggregate
{
    public class UpdateNotifications(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserNameUpdatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserNameUpdatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var notifications = await _notificationWriteRepository.GetByUserId(notification.User.Id, cancellationToken);
            foreach (var n in notifications)
                n.UpdateUserName(notification.User.UserName.Value, (DateTime)notification.User.UpdatedAt!);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
