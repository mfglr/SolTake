namespace MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Abstracts
{
    public interface ICommentUserLikeReadRepository
    {
        Task<bool> ExistAsync(int commentId, int userId,CancellationToken cancellationToken);
    }
}
