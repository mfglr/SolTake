using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface ISolutionUserVoteQueryRepository
    {
        Task<List<SolutionUserVoteResponseDto>> GetSolutionUpvotes(int accountId, IPage page, int solutionId, CancellationToken cancellationToken);
        Task<List<SolutionUserVoteResponseDto>> GetSolutionDownvotes(int accountId, IPage page, int solutionId, CancellationToken cancellationToken);
    }
}
