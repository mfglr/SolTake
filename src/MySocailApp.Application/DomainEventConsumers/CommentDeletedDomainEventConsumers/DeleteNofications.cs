using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.CommentDeletedDomainEventConsumers
{
    public class DeleteNofications(INotificationWriteRepository notificationWriteRepository, IUnitOfWork uniOfWork) : IDomainEventConsumer<CommentDeletedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _uniOfWork = uniOfWork;

        public async Task Handle(CommentDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var notifications = await _notificationWriteRepository.GetByCommentId(notification.CommentId, cancellationToken);
            _notificationWriteRepository.DeleteRange(notifications);
            await _uniOfWork.CommitAsync(cancellationToken);
        }
    }
}
