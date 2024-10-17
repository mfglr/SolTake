using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.Interfaces
{
    public interface IQuestionWriteRepository
    {
        Task CreateAsync(Question question, CancellationToken cancellationToken);
        void Delete(Question question);
        void DeleteRange(IEnumerable<Question> questions);
        Task<Question?> GetByIdAsync(int id,CancellationToken cancellationToken);
        Task<Question?> GetQuestionWithImagesAsync(int questionId,CancellationToken cancellationToken);
        Task<Question?> GetWithLikeByIdAsync(int id, int userId, CancellationToken cancellationToken);
        Task<Question?> GetQuestionWithSaveAsync(int questionId, int saverId, CancellationToken cancellationToken);

        Task<Question?> GetQuestionAsync(int questionId,CancellationToken cancellationToken);
        Task<List<Question>> GetUserQuestionsAsync(int userId, CancellationToken cancellationToken);
        Task<List<Question>> GetQuestionsSavedByUserId(int userId, CancellationToken cancellationToken);
        Task<List<Question>> GetQuestionsLikedByUserId(int userId, CancellationToken cancellationToken);
    }
}
