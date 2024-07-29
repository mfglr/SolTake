using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.ValueObjects;

namespace MySocailApp.Domain.NotificationAggregate.Entities
{
    public class Notification : IAggregateRoot
    {
        public int Id { get; protected set; }
        public int OwnerId { get; protected set; }
        public DateTime CreatedAt { get; protected set; }
        public bool IsViewed { get; protected set; }
        public NotificationType Type { get; protected set; }
        public int? CommentId { get; private set; }

        public void MarkAsViewed() => IsViewed = true;

        internal void CreateCommentCreatedNotification(int ownerId, int commentId)
        {
            OwnerId = ownerId;
            CommentId = commentId;
            IsViewed = false;
            Type = NotificationType.QuestionCommentCreatedNotification;
            CreatedAt = DateTime.UtcNow;
        }

        public AppUser Owner { get; } = null!;
        public Comment? Comment { get; }
    }
}
