using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface ISolutionUserVoteQueryRepository
    {
        Task<SolutionUserVoteResponseDto?> GetSolutionVote(int voteId, CancellationToken cancellationToken);
        Task<List<SolutionUserVoteResponseDto>> GetSolutionUpvotes(IPage page, int solutionId, CancellationToken cancellationToken);
        Task<List<SolutionUserVoteResponseDto>> GetSolutionDownvotes(IPage page, int solutionId, CancellationToken cancellationToken);
    }
}
