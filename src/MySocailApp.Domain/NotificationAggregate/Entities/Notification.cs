using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.ValueObjects;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;

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
        public int? CommentId { get; private set; }
        public int? QuestionId { get; private set; }
        public int? SolutionId { get; private set; }
        
        public void MarkAsViewed() => IsViewed = true;
        
        private Notification(NotificationType type) => Type = type;

        public static Notification QuestionCommentCreatedNotification(int ownerId, int userId, int commentId, int questionId)
            => new(NotificationType.QuestionCommentCreatedNotification)
            {
                OwnerId = ownerId,
                UserId = userId,
                CommentId = commentId,
                QuestionId = questionId,
                CreatedAt = DateTime.UtcNow,
            };
        
        public static Notification SolutionCommentCreatedNotification(int ownerId, int userId, int commentId, int solutionId)
            => new(NotificationType.SolutionCommentCreatedNotification)
            {
                OwnerId = ownerId,
                UserId = userId,
                CommentId = commentId,
                SolutionId = solutionId,
                CreatedAt = DateTime.UtcNow,
            };

        public static Notification CommentRepliedNotification(int ownerId, int userId, int commentId, int? questionId, int? solutionId, int parentId)
            => new(NotificationType.CommentRepliedNotification)
            {
                OwnerId = ownerId,
                CommentId = commentId,
                UserId = userId,
                ParentId = parentId,
                QuestionId = questionId,
                SolutionId = solutionId,
                CreatedAt = DateTime.UtcNow
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
        public Question? Question { get; }
        public Comment? Comment { get; }
        public Solution? Solution { get; }
    }
}
