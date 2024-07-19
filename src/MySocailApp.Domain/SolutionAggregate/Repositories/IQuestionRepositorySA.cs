using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.SolutionAggregate.Repositories
{
    public interface IQuestionRepositorySA
    {
        Task<Question?> GetByIdAsync(int id, CancellationToken cancellationToken);
    }
}
