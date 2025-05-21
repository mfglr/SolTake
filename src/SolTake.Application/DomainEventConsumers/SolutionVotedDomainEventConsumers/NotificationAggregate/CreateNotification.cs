using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Entities;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using SolTake.Domain.SolutionUserVoteAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.SolutionVotedDomainEventConsumers.NotificationAggregate
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<SolutionUserVoteCreatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(SolutionUserVoteCreatedDomainEvent notification, CancellationToken cancellationToken)
        {

            if (notification.Solution.UserId == notification.Vote.UserId) return;

            var n = Notification.SolutionVotedNotification(
                notification.Solution.UserId,
                notification.Vote.UserId,
                notification.Login.UserName,
                notification.Login.Image,
                notification.Solution.Id,
                notification.Solution.Content?.Value,
                notification.Solution.Medias.FirstOrDefault(),
                notification.Vote.Type
            );
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new NotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
