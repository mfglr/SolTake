using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.UserDomain.FollowAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserFollowedDomainEventConsumers.NotificationAggregate
{
    public class CreateUserFollowedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<UserFollowedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(UserFollowedDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = Notification.UserFollowedNotification(notification.Follow.FollowerId, notification.Follow.FollowedId);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new UserFollowedNotificationCreatedDomainEvent(n, notification.Follow), cancellationToken);
        }
    }
}
