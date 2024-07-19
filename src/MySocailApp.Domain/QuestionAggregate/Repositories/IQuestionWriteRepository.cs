using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.Repositories
{
    public interface IQuestionWriteRepository
    {
        Task CreateAsync(Question question, CancellationToken cancellationToken);
        Task<Question?> GetByIdAsync(int id);
        Task<Question?> GetWithLikeByIdAsync(int id, int userId, CancellationToken cancellationToken);
    }
}
