using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class CommentUserLikeNotification(int appUserId)
    {
        public int CommentId { get; private set; }
        public int AppUserId { get; private set; } = appUserId;
    }
}
