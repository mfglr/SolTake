using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.UserUserFollowAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserUserFollowCreatedDomainEventConsumers.NotificationAggregate
{
    public class CreateUserFollowedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<UserUserFollowCreatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(UserUserFollowCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = Notification.UserFollowedNotification(
                notification.User.Id,
                notification.Login.UserId,
                notification.Login.UserName,
                notification.Login.Image
            );
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new NotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
