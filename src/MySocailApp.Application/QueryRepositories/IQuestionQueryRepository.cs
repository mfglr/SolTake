using MySocailApp.Application.Queries.QuestionDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IQuestionQueryRepository
    {
        Task<QuestionResponseDto?> GetQuestionByIdAsync(int id, int accountId, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetHomePageQuestionsAsync(int? userId, IPage page, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetUserQuestionsAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetTopicQuestionsAsync(int topicId, int accountId, IPage page, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetSubjectQuestionsAsync(int subjectId, int accountId, IPage page, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetExamQuestionsAsync(int examId, int accountId, IPage page, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetVideoQuestionsAsync(int? accountId, IPage page,CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> SearchQuestionsAsync(int accountId, IPage page,int? examId, int? subjectId, int? topicId, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetSolvedQuestionsByUserIdAsync(int accountId, IPage page, int userId, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetUnsolvedQuestionsByUserIdAsync(int accountId, IPage page, int userId, CancellationToken cancellationToken);
    }
}
