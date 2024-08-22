using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Interfaces
{
    public interface ICommentReadRepository
    {
        Task<Comment?> GetAsync(int id, CancellationToken cancellationToken);
        Task<bool> Exist(int id, CancellationToken cancellationToken);
        Task<Comment?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Comment>> GetByIds(IEnumerable<int> ids,CancellationToken cancellationToken);
        Task<List<SolutionComment>> GetBySolutionIdAsync(int solutionId, int? lastId, CancellationToken cancellationToken);
        Task<List<QuestionComment>> GetByQuestionIdAsync(int questionId, int? lastId, int? take, CancellationToken cancellationToken);
        Task<List<ChildComment>> GetByParentIdAsync(int parentId, int? lastId, int? take, bool isDescending, CancellationToken cancellationToken);
        Task<List<AppUser>> GetCommentLikesAsync(int commentId, int? lastId, int? take, CancellationToken cancellationToken);
    }
}
