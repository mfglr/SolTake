using MySocailApp.Domain.QuestionAggregate.Entities;
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
        Task<Solution?> GetWithSaverByIdAsync(int solutionId, int saverId, CancellationToken cancellationToken);

        Task<Solution?> GetSolutionAsync(int solutionId, CancellationToken cancellationToken);
        Task<List<Solution>> GetUserSolutionsAsync(int userId, CancellationToken cancellationToken);
        Task<List<Solution>> GetQuestionSolutionsAsync(int userId, CancellationToken cancellationToken);

        Task DeleteSolutionUserSavesByUserId(int userId,CancellationToken cancellation);
        Task DeleteSolutionUserVotesByUserId(int userId,CancellationToken cancellationToken);
        Task DeleteSolutionUserVoteNotificationsByUserId(int userId, CancellationToken cancellationToken);
    }
}
