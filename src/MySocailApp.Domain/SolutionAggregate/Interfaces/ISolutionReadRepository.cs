using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionAggregate.Interfaces
{
    public interface ISolutionReadRepository
    {
        Task<Solution?> GetSolutionWithImagesByIdAsync(int id, CancellationToken cancellationToken);
        Task<bool> Exist(int id, CancellationToken cancellationToken);
        Task<Solution?> GetAsync(int id, CancellationToken cancellationToken);
        Task<int> GetNumberOfQuestionCorrectSolutionsAsync(int questionId, CancellationToken cancellationToken);
    }
}
