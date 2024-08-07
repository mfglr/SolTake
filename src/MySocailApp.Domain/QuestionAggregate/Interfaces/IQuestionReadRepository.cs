using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.Interfaces
{
    public interface IQuestionReadRepository
    {
        Task<bool> Exist(int questionId, CancellationToken cancellationToken);
        Task<Question?> GetQuestionWithImagesById(int id, CancellationToken cancellationToken);
        Task<Question?> GetAsync(int questionId, CancellationToken cancellationToken);
        Task<List<Question>> GetAllAsync(int? lastId, CancellationToken cancellationToken);
        Task<Question?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Question>> GetByUserIdAsync(int userId, int? lastId, CancellationToken cancellationToken);
        Task<List<Question>> GetByTopicIdAsync(int topicId, int? lastId, CancellationToken cancellationToken);
        Task<List<Question>> GetBySubjectIdAsync(int subjectId, int? lastId, CancellationToken cancellationToken);
        Task<List<Question>> GetByExamIdAsync(int examId, int? lastId, CancellationToken cancellationToken);
    }
}
