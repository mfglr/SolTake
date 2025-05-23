using MySocailApp.Application.Queries.SolutionDomain;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface ISolutionUserSaveQueryRepository
    {
        Task<List<SolutionUserSaveResponseDto>> GetSolutionUserSaves(int userId, int accountId, IPage page, CancellationToken cancellationToken);
    }
}
