using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionCreatedDomainEventConsumers.NotificationAggregate
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<SolutionCreatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(SolutionCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = Notification.SolutionCreatedNotification(
                notification.Question.UserId,
                notification.Solution.QuestionId,
                notification.Solution.Id,
                notification.Solution.UserId
            );

            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new SolutionNotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
