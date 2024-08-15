using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.Interfaces
{
    public interface IQuestionReadRepository
    {
        Task<bool> Exist(int questionId, CancellationToken cancellationToken);
        Task<Question?> GetQuestionWithImagesById(int id, CancellationToken cancellationToken);
        Task<Question?> GetAsync(int questionId, CancellationToken cancellationToken);
        Task<Question?> GetQuestionByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Question>> GetHomePageQuestionsAsync(int userId,int? offset,int? take,bool isDescending,CancellationToken cancellationToken);
        Task<List<Question>> GetQuestionsByUserIdAsync(int userId, int? lastId, int? take, CancellationToken cancellationToken);
        Task<List<Question>> GetQuestionsByTopicIdAsync(int topicId, int? lastId, int? take, CancellationToken cancellationToken);
        Task<List<Question>> GetQuestionsBySubjectIdAsync(int subjectId, int? lastId, int? take, CancellationToken cancellationToken);
        Task<List<Question>> GetQuestionsByExamIdAsync(int examId, int? lastId, int? take, CancellationToken cancellationToken);
        Task<List<Question>> SearchQuestions(string? key, int? examId, int? subjectId, int? topicId, int? lastId, int? take, CancellationToken cancellationToken);
    }
}
