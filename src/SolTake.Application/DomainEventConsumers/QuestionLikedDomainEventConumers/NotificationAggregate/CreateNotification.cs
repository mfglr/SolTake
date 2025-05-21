using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Entities;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using SolTake.Domain.QuestionUserLikeAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.QuestionLikedDomainEventConumers.NotificationAggregate
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<QuestionLikedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(QuestionLikedDomainEvent notification, CancellationToken cancellationToken)
        {
            if (notification.Question.UserId == notification.Login.UserId) return;

            var n = Notification.QuestionLikedNotification(
                notification.Question.UserId,
                notification.Login.UserId,
                notification.Login.UserName,
                notification.Login.Image,
                notification.Like.QuestionId,
                notification.Question.Content?.Value,
                notification.Question.Medias.FirstOrDefault()
            );

            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new NotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
