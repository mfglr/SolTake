using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.CommentDeletedDomainEventConsumers.NotificationAggregate
{
    public class DeleteNotifications(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<CommentDeletedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(CommentDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            //var notifications = await _notificationWriteRepository.GetNotificationsByRepliedIdOrCommentId(notification.Comment.Id, cancellationToken);
            //_notificationWriteRepository.DeleteRange(notifications);
            //await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
