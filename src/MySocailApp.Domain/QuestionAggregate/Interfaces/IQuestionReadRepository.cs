using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.Interfaces
{
    public interface IQuestionReadRepository
    {
        Task<bool> Exist(int questionId, CancellationToken cancellationToken);
        Task<Question?> GetQuestionWithImagesById(int id, CancellationToken cancellationToken);
        Task<Question?> GetAsync(int questionId, CancellationToken cancellationToken);
    }
}
