using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionAggregate.Abstracts
{
    public interface ISolutionWriteRepository
    {
        void Delete(Solution solution);
        void DeleteRange(IEnumerable<Solution> solutions);
        Task CreateAsync(Solution solution, CancellationToken cancellationToken);
        Task<Solution?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Solution>> GetUserSolutionsAsync(int userId, CancellationToken cancellationToken);
        Task<List<Solution>> GetQuestionSolutionsAsync(int userId, CancellationToken cancellationToken);
        Task<List<Solution>> GetAsync(List<int> questionIds, int userId, CancellationToken cancellationToken);
    }
}
