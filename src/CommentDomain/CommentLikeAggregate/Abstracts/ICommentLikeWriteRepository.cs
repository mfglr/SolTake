using CommentDomain.CommentLikeAggregate.Entities;

namespace CommentDomain.CommentLikeAggregate.Abstracts
{
    public interface ICommentLikeWriteRepository
    {
        Task CreateAsync(CommentLike commentLike, CancellationToken cancellationToken);
        Task<CommentLike> GetAsync(int commentId, int userId, CancellationToken cancellationToken);
    }
}
