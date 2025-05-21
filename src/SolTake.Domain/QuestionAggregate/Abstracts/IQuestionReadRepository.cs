using SolTake.Domain.QuestionAggregate.Entities;

namespace SolTake.Domain.QuestionAggregate.Abstracts
{
    public interface IQuestionReadRepository
    {
        Task<bool> ExistAsync(int questionId, CancellationToken cancellationToken);
        Task<Question?> GetAsync(int questionId, CancellationToken cancellationToken);
        Task<int?> GetUserIdOfQuestionAsync(int questionId, CancellationToken cancellationToken);

        Task<List<int>> GetQuestionIdsOfUser(int userId, CancellationToken cancellationToken);
    }
}
