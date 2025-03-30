using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.QuestionLikedDomainEventConumers.NotificationAggregate
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<QuestionLikedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(QuestionLikedDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = Notification.QuestionLikedNotification(notification.QuestionUserId, notification.Like.QuestionId, notification.Like.UserId);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new QuestionLikedNotificationCreatedDomainEvent(n, notification.Login), cancellationToken);
        }
    }
}
