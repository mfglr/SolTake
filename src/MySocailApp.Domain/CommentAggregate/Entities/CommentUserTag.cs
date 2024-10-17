using MySocailApp.Core;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class CommentUserTag : IHasId
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int CommentId { get; private set; }
        public int AppUserId { get; private set; }

        private CommentUserTag(int appUserId) => AppUserId = appUserId;
        public static CommentUserTag Create(int appUserId) => new (appUserId) { CreatedAt = DateTime.UtcNow };
    }
}
