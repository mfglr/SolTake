using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionAggregate.Interfaces
{
    public interface ISolutionWriteRepository
    {
        void Delete(Solution solution);
        void DeleteRange(IEnumerable<Solution> solutions);
        Task CreateAsync(Solution solution, CancellationToken cancellationToken);
        Task<Solution?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<Solution?> GetWithImagesByIdAsync(int id, CancellationToken cancellationToken);
        Task<Solution?> GetWithVoteByIdAsync(int solutionId, int voterId, CancellationToken cancellationToken);
        Task<Solution?> GetWithVoteAndVoteNotificationByIdAsync(int solutionId, int voterId, CancellationToken cancellationToken);
        Task<Solution?> GetWithCommentsByIdAsync(int id, CancellationToken cancellationToken);
    }
}
