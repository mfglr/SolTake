using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Entities;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using SolTake.Domain.SolutionAggregate.DomainEvents;
using SolTake.Core;

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
