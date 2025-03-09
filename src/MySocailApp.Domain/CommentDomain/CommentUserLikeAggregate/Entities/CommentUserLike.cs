using MySocailApp.Core;

namespace MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Entities
{
    public class CommentUserLike : Entity, IAggregateRoot
    {
        public int CommentId { get; private set; }
        public int UserId { get; private set; }

        private CommentUserLike(int commentId, int userId)
        {
            CommentId = commentId;
            UserId = userId;
        }
        public static CommentUserLike Create(int commentId, int userId) => new(commentId,userId) { CreatedAt = DateTime.UtcNow };
    }
}
