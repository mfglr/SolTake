using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IQuestionUserLikeQueryRepository
    {
        Task<QuestionUserLikeResponseDto?> GetQuestionLikeAsync(int accountId, int likeId, CancellationToken cancellationToken);
        Task<List<QuestionUserLikeResponseDto>> GetQuestionLikesAsync(int questionid, int accountId, IPage pape, CancellationToken cancellationToken);
    }
}
