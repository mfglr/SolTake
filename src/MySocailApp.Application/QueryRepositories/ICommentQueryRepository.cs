using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface ICommentQueryRepository
    {
        Task<CommentResponseDto?> GetByIdAsync(int accountId, int commentId, CancellationToken cancellationToken);
        Task<List<CommentResponseDto>> GetByIds(int accountId, IEnumerable<int> ids, CancellationToken cancellationToken);
        Task<List<CommentResponseDto>> GetCommentsByQuestionIdAsync(int accountId, IPage page, int questionId, CancellationToken cancellationToken);
        Task<List<CommentResponseDto>> GetCommentsByParentIdAsync(int accountId, IPage page, int parentId, CancellationToken cancellationToken);
        Task<List<CommentResponseDto>> GetCommentsBySolutionIdAsync(int accountId, IPage page, int solutionId, CancellationToken cancellationToken);
    }
}
