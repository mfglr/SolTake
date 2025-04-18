using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.CommentCreatedDomainEventConsumers.NotificationAggregate
{
    public class CreateUserTaggedInCommentNotifications(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<CommentCreatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(CommentCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            List<Notification> notifications = new();
            foreach(var tag in notification.Comment.Tags)
            {
                if(
                    tag.UserId != notification.Comment.UserId && 
                    tag.UserId != notification.Replied?.UserId &&
                    tag.UserId != notification.Solution?.UserId &&
                    tag.UserId != notification.Question?.UserId
                )
                {
                    Notification n = Notification.UserTaggedInComment(
                        tag.UserId,
                        notification.Comment.UserId,
                        notification.Login.UserName,
                        notification.Login.Image,
                        notification.Comment.ParentId == null ? notification.Comment.QuestionId : notification.Parent?.QuestionId,
                        notification.Comment.ParentId == null ? notification.Comment.SolutionId : notification.Parent?.SolutionId,
                        notification.Comment.Id,
                        notification.Comment.Content.Value
                    );
                    notifications.Add(n);
                }
            }

            await _notificationWriteRepository.CreateRangeAsync(notifications, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            foreach (var n in notifications)
                await _publisher.Publish(new NotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
