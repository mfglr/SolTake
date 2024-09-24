using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface ISolutionUserSaveQueryRepository
    {
        Task<List<SolutionUserSaveResponseDto>> GetSavedSolutions(int userId, int accountId, IPage page, CancellationToken cancellationToken);
    }
}
