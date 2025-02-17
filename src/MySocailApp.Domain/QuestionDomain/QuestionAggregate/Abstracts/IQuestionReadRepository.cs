using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts
{
    public interface IQuestionReadRepository
    {
        Task<bool> ExistAsync(int questionId, CancellationToken cancellationToken);
        Task<Question?> GetQuestionWithMediasById(int id, CancellationToken cancellationToken);
        Task<Question?> GetAsync(int questionId, CancellationToken cancellationToken);
        Task<int?> GetUserIdOfQuestionAsync(int questionId, CancellationToken cancellationToken);
    }
}
