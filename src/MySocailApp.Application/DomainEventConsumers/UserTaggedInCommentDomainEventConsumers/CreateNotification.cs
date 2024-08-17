using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.DomainEventConsumers.UserTaggedInCommentDomainEventConsumers
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserTaggedInCommentDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserTaggedInCommentDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = Notification.UserTaggedToCommentNotification(notification.UserId, notification.Comment.AppUserId, notification.Comment.Id);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
