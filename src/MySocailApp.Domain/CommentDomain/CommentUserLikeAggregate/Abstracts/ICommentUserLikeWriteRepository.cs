using MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Entities;

namespace MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Abstracts
{
    public interface ICommentUserLikeWriteRepository
    {
        Task CreateAsync(CommentUserLike commentUserLike,CancellationToken cancellationToken);
        void Delete(CommentUserLike commentUserLike);
        void DeleteRange(IEnumerable<CommentUserLike> comments);

        Task<List<CommentUserLike>> GetByUserId(int userId,CancellationToken cancellationToken);
        Task<List<CommentUserLike>> GetByCommentId(int commentId, CancellationToken cancellationToken);
    }
}
