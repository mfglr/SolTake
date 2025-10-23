using SolTake.QuestionService.Domain.Entities;

namespace SolTake.QuestionService.Domain.Abstracts
{
    public interface IQuestionRepository
    {
        Task CreateAsync(Question question, CancellationToken cancellationToken);
        Task DeleteAsync(Guid id, CancellationToken cancellationToken);
        Task<Question?> GetByIdAsync(Guid id, CancellationToken cancellationToken);
        Task UpdateAsync(Question question, CancellationToken cancellationToken);
    }
}
