using MySocailApp.Core;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class CommentUserTag : Entity
    {
        public int UserId { get; private set; }

        private CommentUserTag(int userId) => UserId = userId;
        public static CommentUserTag Create(int userId) => new(userId) { CreatedAt = DateTime.UtcNow };
    }
}
