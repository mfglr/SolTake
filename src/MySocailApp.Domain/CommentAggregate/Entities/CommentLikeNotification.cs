using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class CommentLikeNotification(int appUserId)
    {
        public int CommentId { get; private set; }
        public int AppUserId { get; private set; } = appUserId;

        public Comment Comment { get; } = null!;
        public AppUser AppUser { get; } = null!;
    }
}
