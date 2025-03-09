using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface ISolutionUserSaveQueryRepository
    {
        Task<List<SolutionUserSaveResponseDto>> GetSolutionUserSaves(int userId, int accountId, IPage page, CancellationToken cancellationToken);
    }
}
