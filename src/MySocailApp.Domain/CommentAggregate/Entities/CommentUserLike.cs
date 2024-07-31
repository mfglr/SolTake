using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class CommentUserLike
    {
        public int CommentId { get; private set; }
        public int AppUserId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private CommentUserLike(int commentId, int appUserId)
        {
            CommentId = commentId;
            AppUserId = appUserId;
        }

        public static CommentUserLike Create(int questionCommentId, int appUserId)
            => new(questionCommentId, appUserId) { CreatedAt = DateTime.UtcNow };

        // read only navigator property
        public Comment Comment { get; } = null!;
        public AppUser AppUser { get; } = null!;

    }
}
