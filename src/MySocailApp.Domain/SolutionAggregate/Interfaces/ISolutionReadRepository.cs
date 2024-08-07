using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionAggregate.Interfaces
{
    public interface ISolutionReadRepository
    {
        Task<Solution?> GetSolutionWithImagesByIdAsync(int id, CancellationToken cancellationToken);
        Task<bool> Exist(int id, CancellationToken cancellationToken);
        Task<Solution?> GetAsync(int id, CancellationToken cancellationToken);
        Task<Solution?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Solution>> GetByQuestionIdAsync(int questionId, int? lastId, CancellationToken cancellationToken);
    }
}
