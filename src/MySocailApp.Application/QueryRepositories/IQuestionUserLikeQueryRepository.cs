using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IQuestionUserLikeQueryRepository
    {
        Task<List<QuestionUserLikeResponseDto>> GetQuestionLikesAsync(int questionid, int accountId, IPage pape, CancellationToken cancellationToken);
    }
}
