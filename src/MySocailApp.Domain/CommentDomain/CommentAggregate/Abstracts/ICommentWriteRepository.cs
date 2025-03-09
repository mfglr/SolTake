using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.Abstracts
{
    public interface ICommentWriteRepository
    {
        Task CreateAsync(Comment comment, CancellationToken cancellationToken);
        void Delete(Comment comment);
        void DeleteRange(IEnumerable<Comment> comments);

        Task<Comment?> GetAsync(int commentId, CancellationToken cancellationToken);
        Task<Comment?> GetWithLikeByIdAsync(int id, int userId, CancellationToken cancellationToken);

        Task<Comment?> GetCommentAsync(int commentId, CancellationToken cancellationToken);
        Task<List<Comment>> GetUserCommentsAsync(int userId, CancellationToken cancellationToken);
        Task<List<Comment>> GetQuestionCommentsAsync(int questionId, CancellationToken cancellationToken);
        Task<List<Comment>> GetSolutionCommentsAsync(int solutionId, CancellationToken cancellationToken);
        Task<List<Comment>> GetChildrenAsync(int commentId, CancellationToken cancellationToken);
        Task<List<Comment>> GetRepliesAsync(int commentId, CancellationToken cancellationToken);
        Task RemoveCommentLikesByUserId(int userId, CancellationToken cancellationToken);
        Task RemoveCommentUserLikeNotificationsByUserId(int userId, CancellationToken cancellationToken);
        Task RemoveCommentUserTagsByUserId(int userId, CancellationToken cancellationToken);
    }
}
