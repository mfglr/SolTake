using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Interfaces
{
    public interface ICommentWriteRepository
    {
        Task CreateAsync(Comment comment, CancellationToken cancellationToken);
        Task<Comment?> GetWithLikeByIdAsync(int id, int userId, CancellationToken cancellationToken);
    }
}
