using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.CommentLikedDomainEventConsumers.NotificationAggregate
{
    public class CreateCommentLikedNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<CommentLikedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(CommentLikedDomainEvent notification, CancellationToken cancellationToken)
        {
            if (notification.Comment.UserId == notification.Like.UserId) return;

            var n = Notification
                .CommentLikedNotification(
                    notification.Comment.UserId,
                    notification.Like.UserId,
                    notification.Login.UserName,
                    notification.Login.Image,
                    notification.Comment.Id,
                    notification.Comment.Content.Value,
                    notification.Comment.QuestionId,
                    notification.Comment.SolutionId
                );

            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new NotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
