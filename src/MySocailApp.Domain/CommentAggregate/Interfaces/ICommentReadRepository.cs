using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Interfaces
{
    public interface ICommentReadRepository
    {
        Task<Comment?> GetAsync(int id, CancellationToken cancellationToken);
        Task<bool> Exist(int id, CancellationToken cancellationToken);
        Task<Comment?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Comment>> GetBySolutoinIdAsync(int solutionId, int? lastId, CancellationToken cancellationToken);
        Task<List<Comment>> GetByQuestionIdAsync(int questionId, int? lastId, CancellationToken cancellationToken);
        Task<List<Comment>> GetByParentIdAsync(int parentId,int? lastId,int? take,CancellationToken cancellationToken);
    }
}
