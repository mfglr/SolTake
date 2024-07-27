using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Interfaces
{
    public interface ICommentFinder
    {
        Task<Comment?> GetAsync(int id,CancellationToken cancellationToken);
        Task<bool> Exist(int id,CancellationToken cancellationToken);
    }
}
