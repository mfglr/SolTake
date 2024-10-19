using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.NotificationConnectionAggregate
{
    public class DeleteNotificationConnection(INotificationConnectionWriteRepository notificationConnectionWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly INotificationConnectionWriteRepository _notificationConnectionWriteRepository = notificationConnectionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _notificationConnectionWriteRepository.GetByIdAsync(notification.User.Id, cancellationToken);
            if (connection != null) _notificationConnectionWriteRepository.Delete(connection);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
