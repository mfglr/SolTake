using SolTake.Application.Queries.QuestionDomain;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface IQuestionUserLikeQueryRepository
    {
        Task<QuestionUserLikeResponseDto?> GetLikeAsync(int likeId, CancellationToken cancellationToken);
        Task<List<QuestionUserLikeResponseDto>> GetLikesAsync(int questionId, IPage page, CancellationToken cancellationToken);
    }
}
