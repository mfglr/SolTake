using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionAggregate.Abstracts
{
    public interface ISolutionReadRepository
    {
        Task<Solution?> GetSolutionWithImagesByIdAsync(int id, CancellationToken cancellationToken);
        Task<bool> Exist(int id, CancellationToken cancellationToken);
        Task<Solution?> GetAsync(int id, CancellationToken cancellationToken);
        Task<int> GetSolutionUserId(int id, CancellationToken cancellationToken);
        Task<int> GetNumberOfQuestionCorrectSolutionsAsync(int questionId, CancellationToken cancellationToken);
        Task<List<int>> GetSolutionIdsOfUser(int userId, CancellationToken cancellationToken);
    }
}
