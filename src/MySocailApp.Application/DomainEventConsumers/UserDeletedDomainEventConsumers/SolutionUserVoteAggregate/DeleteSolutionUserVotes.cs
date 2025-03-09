using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.SolutionUserVoteAggregate
{
    public class DeleteSolutionUserVotes(IUnitOfWork unitOfWork, ISolutionUserVoteWriteRepository solutinUserVoteWriteRepository) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly ISolutionUserVoteWriteRepository _solutinUserVoteWriteRepository = solutinUserVoteWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var votes = await _solutinUserVoteWriteRepository.GetByUserIdAsync(notification.User.Id,cancellationToken);
            _solutinUserVoteWriteRepository.DeleteRange(votes);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
