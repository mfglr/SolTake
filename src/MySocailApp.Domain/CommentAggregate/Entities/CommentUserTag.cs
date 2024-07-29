using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class CommentUserTag
    {
        public int CommentId { get; private set; }
        public int AppUserId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private CommentUserTag(int commentId, int appUserId)
        {
            CommentId = commentId;
            AppUserId = appUserId;
        }

        public static CommentUserTag Create(int commentId, int appUserId)
            => new (commentId, appUserId) { CreatedAt = DateTime.UtcNow };

        //readonly navigator properties
        public Comment Comment { get; } = null!;
        public AppUser AppUser { get; } = null!;
    }
}
