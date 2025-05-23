using SolTake.Application.InfrastructureServices;
using SolTake.Domain.SolutionUserSaveAggregate.Abstracts;
using SolTake.Domain.UserUserBlockAggregate.DomainEvents;
using SolTake.Core;
using SolTake.Domain.SolutionAggregate.Abstracts;

namespace SolTake.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.SolutionUserSaveAggregate
{
    public class DeleteSolutionUserSaves(ISolutionReadRepository solutionReadRepository, ISolutionUserSaveWriteRepository solutionUserSaveWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly ISolutionUserSaveWriteRepository _solutionUserSaveWriteRepository = solutionUserSaveWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var solutionIdsOfBlocker = await _solutionReadRepository.GetSolutionIdsOfUser(notification.UserUserBlock.BlockerId, cancellationToken);
            var solutionUserSaves0 = await _solutionUserSaveWriteRepository.GetAsync(solutionIdsOfBlocker,notification.UserUserBlock.BlockedId, cancellationToken);
            _solutionUserSaveWriteRepository.DeleteRange(solutionUserSaves0);

            var solutionIdsOfBlocked = await _solutionReadRepository.GetSolutionIdsOfUser(notification.UserUserBlock.BlockedId, cancellationToken);
            var solutionUserSaves1 = await _solutionUserSaveWriteRepository.GetAsync(solutionIdsOfBlocked, notification.UserUserBlock.BlockerId, cancellationToken);
            _solutionUserSaveWriteRepository.DeleteRange(solutionUserSaves1);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
