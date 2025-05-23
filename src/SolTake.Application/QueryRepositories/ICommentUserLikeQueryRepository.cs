using SolTake.Application.Queries.CommentAggregate;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface ICommentUserLikeQueryRepository
    {
        Task<List<CommentUserLikeResponseDto>> GetLikesAsync(int commentId, IPage page, CancellationToken cancellationToken);
        Task<CommentUserLikeResponseDto?> GetLikeAsync(int likeId, CancellationToken cancellationToken);
    }
}
