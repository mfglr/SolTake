using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Interfaces
{
    public interface ICommentReadRepository
    {
        Task<Comment?> GetAsync(int id, CancellationToken cancellationToken);
        Task<bool> Exist(int id, CancellationToken cancellationToken);
        Task<Comment?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Comment>> GetByIds(IEnumerable<int> ids,CancellationToken cancellationToken);
        Task<List<Comment>> GetCommentsBySolutionIdAsync(int solutionId, IPage pagination, CancellationToken cancellationToken);
        Task<List<Comment>> GetCommentsByQuestionIdAsync(int questionId, IPage pagination, CancellationToken cancellationToken);
        Task<List<Comment>> GetCommentsByParentIdAsync(int parentId, IPage pagination, CancellationToken cancellationToken);
    }
}
