using MySocailApp.Domain.SolutionAggregate.Entities;

namespace SolTake.Domain.SolutionAggregate.Abstracts
{
    public interface ISolutionReadRepository
    {
        Task<bool> Exist(int id, CancellationToken cancellationToken);
        Task<Solution?> GetAsync(int id, CancellationToken cancellationToken);
        Task<int> GetSolutionUserId(int id, CancellationToken cancellationToken);
        Task<int> GetNumberOfQuestionCorrectSolutionsAsync(int questionId, CancellationToken cancellationToken);
        Task<List<int>> GetSolutionIdsOfUser(int userId, CancellationToken cancellationToken);
    }
}
