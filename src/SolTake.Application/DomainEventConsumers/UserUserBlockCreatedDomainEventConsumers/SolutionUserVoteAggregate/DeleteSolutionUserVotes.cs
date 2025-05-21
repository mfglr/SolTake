using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.SolutionUserVoteAggregate.Abstracts;
using SolTake.Domain.UserUserBlockAggregate.DomainEvents;
using SolTake.Core;
using SolTake.Domain.SolutionAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.SolutionUserVoteAggregate
{
    public class DeleteSolutionUserVotes(ISolutionUserVoteWriteRepository solutionUserVoteWriteRepository, IUnitOfWork unitOfWork, ISolutionReadRepository solutionReadRepository) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly ISolutionUserVoteWriteRepository _solutionUserVoteWriteRepository = solutionUserVoteWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var solutionIdsOfBlocker = await _solutionReadRepository.GetSolutionIdsOfUser(notification.UserUserBlock.BlockerId, cancellationToken);
            var solutionUserVotes0 = await _solutionUserVoteWriteRepository.GetAsync(solutionIdsOfBlocker, notification.UserUserBlock.BlockedId, cancellationToken);
            _solutionUserVoteWriteRepository.DeleteRange(solutionUserVotes0);

            var solutionIdsOfBlocked = await _solutionReadRepository.GetSolutionIdsOfUser(notification.UserUserBlock.BlockedId, cancellationToken);
            var solutionUserVotes1 = await _solutionUserVoteWriteRepository.GetAsync(solutionIdsOfBlocked, notification.UserUserBlock.BlockerId, cancellationToken);
            _solutionUserVoteWriteRepository.DeleteRange(solutionUserVotes1);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
