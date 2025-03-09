using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Entities;

namespace MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Abstracts
{
    public interface ISolutionUserVoteWriteRepository
    {
        Task CreateAsync(SolutionUserVote vote,CancellationToken cancellationToken);
        void Delete(SolutionUserVote vote);
        void DeleteRange(IEnumerable<SolutionUserVote> votes);

        Task<SolutionUserVote?> GetAsync(int solutionId, int userId, CancellationToken cancellationToken);
        Task<List<SolutionUserVote>> GetByUserIdAsync(int userId, CancellationToken cancellationToken);
    }
}
