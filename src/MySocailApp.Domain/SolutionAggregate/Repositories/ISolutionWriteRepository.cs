using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionAggregate.Repositories
{
    public interface ISolutionWriteRepository
    {
        Task<Solution?> GetByIdAsync(int id,CancellationToken cancellationToken);
        Task<Solution?> GetWithVotesByIdAsync(int id, CancellationToken cancellationToken);
        Task CreateAsync(Solution solution, CancellationToken cancellationToken);
    }
}
