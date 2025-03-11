using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface ICommentUserLikeQueryRepository
    {
        Task<List<CommentUserLikeResponseDto>> GetLikesAsync(int commentId, IPage page, CancellationToken cancellationToken);
        Task<CommentUserLikeResponseDto?> GetLikeAsync(int likeId, CancellationToken cancellationToken);
    }
}
