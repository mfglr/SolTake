using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.ProfileImageUpdatedDomainEventConsumers.NotificationAggregate
{
    public class ChangeProfileImagesOfNotifications(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<ProfileImageUpdatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(ProfileImageUpdatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var notifications = await _notificationWriteRepository.GetByUserId(notification.User.Id,cancellationToken);
            foreach (var n in notifications)
                n.UpdateImage(
                    notification.User.Image != null ? Multimedia.Clone(notification.User.Image) : null,
                    (DateTime)notification.User.UpdatedAt!
                );
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
