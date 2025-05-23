using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Entities;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using SolTake.Core;
using SolTake.Domain.CommentAggregate.DomainEvents;

namespace SolTake.Application.DomainEventConsumers.CommentLikedDomainEventConsumers.NotificationAggregate
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
