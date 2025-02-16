using MySocailApp.Application.Queries.QuestionDomain.QuestionUserLikeAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IQuestionUserLikeQueryRepository
    {
        Task<QuestionUserLikeResponseDto?> GetQuestionLikeAsync(int likeId, CancellationToken cancellationToken);
        Task<List<QuestionUserLikeResponseDto>> GetQuestionLikesAsync(int questionId, IPage page, CancellationToken cancellationToken);
    }
}
