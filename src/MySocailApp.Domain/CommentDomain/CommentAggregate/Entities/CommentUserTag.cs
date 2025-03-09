using MySocailApp.Core;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.Entities
{
    public class CommentUserTag : IHasId
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int CommentId { get; private set; }
        public int UserId { get; private set; }

        private CommentUserTag(int userId) => UserId = userId;
        public static CommentUserTag Create(int userId) => new(userId) { CreatedAt = DateTime.UtcNow };
    }
}
