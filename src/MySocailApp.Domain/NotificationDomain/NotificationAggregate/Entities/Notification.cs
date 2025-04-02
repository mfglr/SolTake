using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.ValueObjects;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities
{
    public class Notification : Entity, IAggregateRoot
    {
        public int OwnerId { get; private set; }
        public NotificationType Type { get; private set; }
        public bool IsViewed { get; private set; }
        public int UserId { get; private set; }
        public string UserName { get; private set; }
        public Multimedia? Image { get; private set; }

        public int? QuestionId { get; private set; }
        public string? QuestionContent { get; private set; }
        public Multimedia? QuestionMedia { get; private set; }

        public int? CommentId { get; private set; }
        public string? CommentContent { get; private set; }

        public int? SolutionId { get; private set; }
        public string? SolutionContent { get; private set; }
        public Multimedia? SolutionMedia { get; private set; }

        private Notification() { }
        
        private Notification(int ownerId, NotificationType type, int userId, string userName, Multimedia? image)
        {
            OwnerId = ownerId;
            Type = type;
            UserId = userId;
            UserName = userName;
            Image = image;
        }

        public static Notification QuestionLikedNotification(int ownerId, int userId, string userName, Multimedia? image, int questionId,string? questionContent, Multimedia? questionMedia)
        {
            var notification = new Notification(ownerId, NotificationType.QuestionLikedNotification, userId, userName, image)
            {
                QuestionId = questionId,
                QuestionContent = questionContent,
                QuestionMedia = questionMedia,
                CreatedAt = DateTime.UtcNow,
            };
            notification.AddDomainEvent(new NotificationCreatedDomainEvent(notification));
            return notification;
        }

        public static Notification QuestionCommentCreatedNotification(int ownerId, int userId, string userName, Multimedia? image, int questionId, string? questionContent, Multimedia? questionMedia, int commentId, string commentContent)
        {
            var notification = new Notification(ownerId, NotificationType.QuestionCommentCreatedNotification, userId, userName, image)
            {
                QuestionId = questionId,
                QuestionContent = questionContent,
                QuestionMedia = questionMedia,
                CommentId = commentId,
                CommentContent = commentContent,
                CreatedAt = DateTime.UtcNow,
            };
            notification.AddDomainEvent(new NotificationCreatedDomainEvent(notification));
            return notification;
        }

        public static Notification SolutionCreatedNotification(int ownerId, int userId, string userName, Multimedia? image, int solutionId, string? solutionContent, Multimedia? solutionMedia) 
        {
            var notification = new Notification(ownerId, NotificationType.SolutionCreatedNotification, userId, userName, image)
            {
                CreatedAt = DateTime.UtcNow,
                SolutionId = solutionId,
                SolutionContent = solutionContent,
                SolutionMedia = solutionMedia
            };
            notification.AddDomainEvent(new NotificationCreatedDomainEvent(notification));
            return notification;
        }

        public static Notification SolutionCommentCreatedNotification(int ownerId, int userId, string userName, Multimedia? image, int solutionId, string? solutionContent, Multimedia? solutionMedia, int? commentId, string? commentContent)
        {
            var notification = new Notification(ownerId, NotificationType.SolutionCommentCreatedNotification, userId, userName, image)
            {
                CreatedAt = DateTime.UtcNow,
                SolutionId = solutionId,
                SolutionContent = solutionContent,
                SolutionMedia = solutionMedia,
                CommentId = commentId,
                CommentContent = commentContent,
            };
            notification.AddDomainEvent(new NotificationCreatedDomainEvent(notification));
            return notification;
        }

        public void MarkAsViewed() => IsViewed = true;

        public void UpdateUserName(string userName, DateTime updatedAt)
        {
            if (UpdatedAt >= updatedAt) return;

            UserName = userName;
            UpdatedAt = updatedAt;
        }

        public void UpdateImage(Multimedia? image,DateTime updatedAt)
        {
            if (UpdatedAt >= updatedAt) return;

            Image = image;
            UpdatedAt = updatedAt;
        }
    }
}
