using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionAggregate.Repositories
{
    public interface ISolutionReadRepository
    {
        Task<Solution?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Solution>> GetByQuestionIdAsync(int questionId, int? lastId, CancellationToken cancellationToken);
    }
}
