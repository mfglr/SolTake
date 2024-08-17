using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.ValueObjects;

namespace MySocailApp.Domain.NotificationAggregate.Entities
{
    public class Notification : IPaginableAggregateRoot
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int OwnerId { get; private set; }
        public int UserId { get; private set; }
        public bool IsViewed { get; private set; }
        public NotificationType Type { get; private set; }

        public int? ParentId { get; private set; }
        public ParentType? ParentType { get; private set; }
        public int? CommentId { get; private set; }
        public int? QuestionId { get; private set; }
        public int? SolutionId { get; private set; }
        
        public void MarkAsViewed() => IsViewed = true;
        
        private Notification(NotificationType type)
        {
            Type = type;
            IsViewed = false;
        }

        public static Notification CreateCommentCreatedNotification(int ownerId, int userId, int commentId, ParentType? parentType,int? parentId)
            => new(NotificationType.CommentCreatedNotification)
            {
                OwnerId = ownerId,
                CommentId = commentId,
                UserId = userId,
                ParentType = parentType,
                ParentId = parentId,
                CreatedAt = DateTime.UtcNow,
            };

        public static Notification QuestionLikedNotification(int ownerId, int questionId, int likerId)
            => new(NotificationType.QuestionLikedNotification)
            {
                OwnerId = ownerId,
                QuestionId = questionId,
                UserId = likerId,
                CreatedAt = DateTime.UtcNow,
            };

        public static Notification CommentLikedNotification(int ownerId, int commentId, int likerId)
            => new(NotificationType.CommentLikedNotification)
            {
                OwnerId = ownerId,
                CommentId = commentId,
                UserId = likerId,
                CreatedAt = DateTime.UtcNow,
            };

        public static Notification SolutionCreatedNotification(int ownerId,int questionId,int solutionId, int userId)
            => new(NotificationType.SolutionCreatedNotification)
            {
                OwnerId = ownerId,
                QuestionId = questionId,
                SolutionId = solutionId,
                UserId = userId,
                CreatedAt = DateTime.UtcNow,
            };

        public static Notification UserTaggedToCommentNotification(int ownerId, int userId, int commentId)
            => new(NotificationType.UserTaggedCommentNotification)
            {
                OwnerId = ownerId,
                UserId = userId,
                CommentId = commentId,
                CreatedAt = DateTime.UtcNow,
            };

        public AppUser Owner { get; } = null!;
        public AppUser User { get; } = null!;
        public Comment? Comment { get; }
    }
}
