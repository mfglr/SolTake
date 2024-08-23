using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.Interfaces
{
    public interface IQuestionReadRepository
    {
        Task<bool> Exist(int questionId, CancellationToken cancellationToken);
        Task<Question?> GetQuestionWithImagesById(int id, CancellationToken cancellationToken);
        Task<Question?> GetAsync(int questionId, CancellationToken cancellationToken);
        Task<Question?> GetQuestionByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Question>> GetHomePageQuestionsAsync(int userId, IPagination pagination, CancellationToken cancellationToken);
        Task<List<Question>> GetQuestionsByUserIdAsync(int userId, IPagination pagination, CancellationToken cancellationToken);
        Task<List<Question>> GetQuestionsByTopicIdAsync(int topicId, IPagination pagination, CancellationToken cancellationToken);
        Task<List<Question>> GetQuestionsBySubjectIdAsync(int subjectId, IPagination pagination, CancellationToken cancellationToken);
        Task<List<Question>> GetQuestionsByExamIdAsync(int examId, IPagination pagination, CancellationToken cancellationToken);
        Task<List<Question>> SearchQuestions(string? key, int? examId, int? subjectId, int? topicId, IPagination pagination, CancellationToken cancellationToken);
        Task<List<Question>> GetSolvedQuestionsByUserIdAsync(int userId, IPagination pagination, CancellationToken cancellationToken);
        Task<List<Question>> GetUnsolvedQuestionsByUserIdAsync(int userId, IPagination pagination, CancellationToken cancellationToken);
    }
}
