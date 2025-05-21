using SolTake.Domain.SolutionUserSaveAggregate.Abstracts;
using SolTake.Domain.SolutionUserSaveAggregate.Entities;
using SolTake.Domain.SolutionUserSaveAggregate.Exceptions;
using SolTake.Domain.UserUserBlockAggregate.Abstracts;
using SolTake.Domain.SolutionAggregate.Abstracts;

namespace SolTake.Domain.SolutionUserSaveAggregate.DomainServices
{
    public class SolutionUserSaveCreatorDomainService(ISolutionReadRepository solutionReadRepository, IUserUserBlockRepository userUserBlockRepository, ISolutionUserSaveReadRepository solutionUserSaveReadRepository)
    {
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;
        private readonly ISolutionUserSaveReadRepository _solutionUserSaveReadRepository = solutionUserSaveReadRepository;

        public async Task CreateAsync(SolutionUserSave solutionUserSave, CancellationToken cancellationToken)
        {
            var solution =
                await _solutionReadRepository.GetAsync(solutionUserSave.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(solution.UserId, solutionUserSave.UserId, cancellationToken))
                throw new SolutionNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(solutionUserSave.UserId, solution.UserId, cancellationToken))
                throw new UserBlockedException();

            if (await _solutionUserSaveReadRepository.ExistAsync(solutionUserSave.SolutionId, solutionUserSave.UserId, cancellationToken))
                throw new SolutionAlreadySavedException();

            solutionUserSave.Create();
        }
    }
}
