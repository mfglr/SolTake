using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts
{
    public interface IQuestionReadRepository
    {
        Task<bool> Exist(int questionId, CancellationToken cancellationToken);
        Task<Question?> GetQuestionWithImagesById(int id, CancellationToken cancellationToken);
        Task<Question?> GetAsync(int questionId, CancellationToken cancellationToken);
    }
}
