using MySocailApp.Application.Queries.QuestionDomain.QuestionUserLikeAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IQuestionUserLikeQueryRepository
    {
        Task<QuestionUserLikeResponseDto?> GetLikeAsync(int likeId, CancellationToken cancellationToken);
        Task<List<QuestionUserLikeResponseDto>> GetLikesAsync(int questionId, IPage page, CancellationToken cancellationToken);
    }
}
