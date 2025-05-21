using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using SolTake.Domain.QuestionUserLikeAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.QuestionDislikedDomainEventConsumers.NotificationAggregate
{
    public class DeleteNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<QuestionDislikedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(QuestionDislikedDomainEvent notification, CancellationToken cancellationToken)
        {
            //var notifications = await _notificationWriteRepository.GetQuestionLikedNotificationsAsync(notification.Like.QuestionId, notification.Like.UserId, cancellationToken);
            //_notificationWriteRepository.DeleteRange(notifications);
            //await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
