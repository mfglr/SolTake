using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.DomainEventConsumers.CommentLikedDomainEventConsumers
{
    public class CreateNotification(INotificationWriteRepository repository, IUnitOfWork unitOfWork) : IDomainEventConsumer<CommentLikedDomainEvent>
    {
        private readonly INotificationWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(CommentLikedDomainEvent notification, CancellationToken cancellationToken)
        {
            await _repository.CreateAsync(
                Notification.CommentLikedNotification(notification.Comment.AppUserId,notification.Comment.Id,notification.LikerId),
                cancellationToken
            );
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
