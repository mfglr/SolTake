using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Interfaces
{
    public interface ICommentWriteRepository
    {
        Task CreateAsync(Comment comment, CancellationToken cancellationToken);
        void Delete(Comment comment);
        void DeleteRange(IEnumerable<Comment> comments);
        
        Task<Comment?> GetAsync(int commentId, CancellationToken cancellationToken);
        Task<Comment?> GetWithLikeByIdAsync(int id, int userId, CancellationToken cancellationToken);
        Task<Comment?> GetCommentWithAllByIdAsync(int id, CancellationToken cancellationToken);
    }
}
