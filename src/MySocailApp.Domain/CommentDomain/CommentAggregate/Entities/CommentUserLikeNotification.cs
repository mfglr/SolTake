namespace MySocailApp.Domain.CommentDomain.CommentAggregate.Entities
{
    public class CommentUserLikeNotification(int userId)
    {
        public int CommentId { get; private set; }
        public int UserId { get; private set; } = userId;
    }
}
