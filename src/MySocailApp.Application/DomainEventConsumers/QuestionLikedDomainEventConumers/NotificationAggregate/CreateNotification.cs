using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.QuestionLikedDomainEventConumers.NotificationAggregate
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<QuestionLikedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(QuestionLikedDomainEvent notification, CancellationToken cancellationToken)
        {
            var question = notification.Question;
            var n = Notification.QuestionLikedNotification(question.AppUserId, question.Id, notification.Like.AppUserId);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new QuestionLikedNotificationCreatedDomainEvent(n, notification.Like.Id));
        }
    }
}
