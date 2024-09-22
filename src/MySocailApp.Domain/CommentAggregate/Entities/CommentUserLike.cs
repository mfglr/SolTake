using MySocailApp.Core;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class CommentUserLike : Entity
    {
        public int CommentId { get; private set; }
        public int AppUserId { get; private set; }

        private CommentUserLike(int appUserId) =>AppUserId = appUserId;

        public static CommentUserLike Create(int appUserId) => new(appUserId) { CreatedAt = DateTime.UtcNow };
    }
}
