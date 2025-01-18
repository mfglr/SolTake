using MySocailApp.Core;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class CommentUserLike : IHasId
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int CommentId { get; private set; }
        public int UserId { get; private set; }

        private CommentUserLike(int userId) => UserId = userId;
        public static CommentUserLike Create(int userId) => new(userId) { CreatedAt = DateTime.UtcNow };
    }
}
