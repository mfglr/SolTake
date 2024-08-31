using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface ICommentUserLikeQueryRepository
    {
        Task<List<CommentUserLikeResponseDto>> GetLikesAsync(int commentId, int accountId, IPage page, CancellationToken cancellationToken);
    }
}
