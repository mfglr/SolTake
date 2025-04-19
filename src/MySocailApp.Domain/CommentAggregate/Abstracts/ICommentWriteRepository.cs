using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Abstracts
{
    public interface ICommentWriteRepository
    {
        Task CreateAsync(Comment comment, CancellationToken cancellationToken);
        void Delete(Comment comment);
        void DeleteRange(IEnumerable<Comment> comments);

        Task<Comment?> GetAsync(int commentId, CancellationToken cancellationToken);

        Task<Comment?> GetCommentAsync(int commentId, CancellationToken cancellationToken);
        Task<List<Comment>> GetUserCommentsAsync(int userId, CancellationToken cancellationToken);
        Task<List<Comment>> GetQuestionCommentsAsync(int questionId, CancellationToken cancellationToken);
        Task<List<Comment>> GetSolutionCommentsAsync(int solutionId, CancellationToken cancellationToken);
        Task<List<Comment>> GetChildrenAsync(int commentId, CancellationToken cancellationToken);
        Task<List<Comment>> GetRepliesAsync(int commentId, CancellationToken cancellationToken);
        Task<List<Comment>> GetCommentsByTag(int userId, CancellationToken cancellationToken);

        Task<List<Comment>> GetQuestionsComments(IEnumerable<int> questionIds, int userId, CancellationToken cancellationToken);
        Task<List<Comment>> GetSolutionsComments(IEnumerable<int> solutionIds, int userId, CancellationToken cancellationToken);
        Task<List<Comment>> GetCommentsReplies(IEnumerable<int> commentIds, int userId, CancellationToken cancellationToken);
    }
}
