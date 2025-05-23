using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Entities;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using SolTake.Domain.SolutionAggregate.DomainEvents;
using SolTake.Core;

namespace SolTake.Application.DomainEventConsumers.SolutionMarkedAsIncorrectDomainEventConsumers.NotificationAggregate
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<SolutionMarkedAsIncorrectDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(SolutionMarkedAsIncorrectDomainEvent notification, CancellationToken cancellationToken)
        {
            var n = Notification.SolutionMarkedAsIncorrectNotification(
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
