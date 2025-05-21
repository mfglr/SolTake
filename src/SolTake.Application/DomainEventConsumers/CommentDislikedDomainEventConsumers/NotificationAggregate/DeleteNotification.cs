using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using SolTake.Core;
using SolTake.Domain.CommentAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.CommentDislikedDomainEventConsumers.NotificationAggregate
{
    public class DeleteNotification(INotificationWriteRepository notficationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<CommentDislikedDomainEvent>
    {
        private readonly INotificationWriteRepository _notficationWriteRepository = notficationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(CommentDislikedDomainEvent notification, CancellationToken cancellationToken)
        {
            //var n = await _notficationWriteRepository.GetCommentLikedNotificationAsync(notification.Comment.Id, notification.Comment.UserId, cancellationToken);
            //if (n == null) return;

            //_notficationWriteRepository.Delete(n);
            //await _unitOfWork.CommitAsync(cancellationToken);

        }
    }
}
