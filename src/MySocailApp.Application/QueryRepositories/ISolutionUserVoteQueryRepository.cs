using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface ISolutionUserVoteQueryRepository
    {
        Task<SolutionUserVoteResponseDto?> GetSolutionVote(int accountId, int voteId, CancellationToken cancellationToken);
        
        Task<List<SolutionUserVoteResponseDto>> GetSolutionUpvotes(int accountId, IPage page, int solutionId, CancellationToken cancellationToken);
        Task<List<SolutionUserVoteResponseDto>> GetSolutionDownvotes(int accountId, IPage page, int solutionId, CancellationToken cancellationToken);
    }
}
