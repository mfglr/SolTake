using SolTake.Application.Queries.QuestionDomain;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface IQuestionQueryRepository
    {
        Task<QuestionResponseDto?> GetQuestionByIdAsync(int id, int? forUserId, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetHomePageQuestionsAsync(int? userId, IPage page, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetUserQuestionsAsync(int userId, int? forUserId, IPage page, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetTopicQuestionsAsync(int topicId, int? forUserId, IPage page, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetSubjectQuestionsAsync(int subjectId, int? forUserId, IPage page, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetExamQuestionsAsync(int examId, int? forUserId, IPage page, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetVideoQuestionsAsync(int? forUserId, IPage page,CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> SearchQuestionsAsync(int? forUserId, IPage page,int? examId, int? subjectId, int? topicId, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetSolvedQuestionsByUserIdAsync(int? forUserId, IPage page, int userId, CancellationToken cancellationToken);
        Task<List<QuestionResponseDto>> GetUnsolvedQuestionsByUserIdAsync(int? forUserId, IPage page, int userId, CancellationToken cancellationToken);
    }
}
