using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.SolutionAggregate
{
    public class DeleteSolutionUserVoteNotifications(ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            await _solutionWriteRepository.DeleteSolutionUserVoteNotificationsByUserId(notification.User.Id, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
