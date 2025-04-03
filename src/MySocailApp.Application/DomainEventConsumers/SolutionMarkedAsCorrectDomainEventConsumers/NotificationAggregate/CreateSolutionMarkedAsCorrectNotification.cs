using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionMarkedAsCorrectDomainEventConsumers.NotificationAggregate
{
    public class CreateSolutionMarkedAsCorrectNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<SolutionMarkedAsCorrectDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(SolutionMarkedAsCorrectDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = Notification.SolutionMarkedAsCorrectNotification(
                notification.Solution.UserId,
                notification.Question.UserId,
                notification.Login.UserName,
                notification.Login.Image,
                notification.Solution.Id,
                notification.Solution.Content?.Value,
                notification.Solution.Medias.FirstOrDefault()
            );
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new NotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
