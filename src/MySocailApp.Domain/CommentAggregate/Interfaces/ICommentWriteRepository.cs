using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Interfaces
{
    public interface ICommentWriteRepository
    {
        Task CreateAsync(Comment comment, CancellationToken cancellationToken);
        void Delete(Comment comment);
        Task<Comment?> GetWithAllAsync(int id, CancellationToken cancellationToken);
        Task<Comment?> GetAsync(int commentId, CancellationToken cancellationToken);
        Task<Comment?> GetWithLikeByIdAsync(int id, int userId, CancellationToken cancellationToken);
    }
}
