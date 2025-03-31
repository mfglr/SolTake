using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.SolutionCommentCreatedDomainEventConsumers.NotificationAggregate
{
    public class CreateSolutionCommentCreatedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<SolutionCommentCreatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(SolutionCommentCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = Notification.SolutionCommentCreatedNotification(
                notification.SolutionUserId,
                notification.Comment.UserId,
                notification.Comment.Id,
                (int)notification.Comment.SolutionId!
            );
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new SolutionCommentNotificationCreatedDomainEvent(n, notification.Comment, notification.Login), cancellationToken);
        }
    }
}
