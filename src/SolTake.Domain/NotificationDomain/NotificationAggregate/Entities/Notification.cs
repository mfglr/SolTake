using SolTake.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using SolTake.Domain.NotificationDomain.NotificationAggregate.ValueObjects;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Core;

namespace SolTake.Domain.NotificationDomain.NotificationAggregate.Entities
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

        public int? RepliedId { get; private set; }
        public string? RepliedContent { get; private set; }

        public SolutionVoteType? SolutionVoteType { get; private set; }

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

        public static Notification CommentRepliedNotification(int ownerId, int userId, string userName, Multimedia? image, int? solutionId, int? questionId, int repliedId, string repliedContent, int commentId, string commentContent)
        {
            var notification = new Notification(ownerId, NotificationType.CommentRepliedNotification, userId, userName, image)
            {
                CreatedAt = DateTime.UtcNow,
                QuestionId = questionId,
                SolutionId = solutionId,
                CommentId = commentId,
                CommentContent = commentContent,
                RepliedId = repliedId,
                RepliedContent = repliedContent,
            };
            notification.AddDomainEvent(new NotificationCreatedDomainEvent(notification));
            return notification;
        }

        public static Notification CommentLikedNotification(int ownerId, int userId, string userName, Multimedia? image,int commentId,string commentContent,int? questionId, int? solutionId)
        {
            var notification = new Notification(ownerId, NotificationType.CommentLikedNotification, userId, userName, image)
            {
                CreatedAt = DateTime.UtcNow,
                CommentId = commentId,
                CommentContent = commentContent,
                QuestionId = questionId,
                SolutionId = solutionId
            };
            notification.AddDomainEvent(new NotificationCreatedDomainEvent(notification));
            return notification;
        }

        public static Notification SolutionMarkedAsCorrectNotification(int ownerId, int userId, string userName, Multimedia? image, int solutionId, string? solutionContent, Multimedia? solutionMedia)
        {
            var notification = new Notification(ownerId, NotificationType.SolutionMarkedAsCorrect, userId, userName, image)
            {
                CreatedAt = DateTime.UtcNow,
                SolutionId = solutionId,
                CommentContent = solutionContent,
                SolutionMedia = solutionMedia,
            };
            notification.AddDomainEvent(new NotificationCreatedDomainEvent(notification));
            return notification;
        }

        public static Notification SolutionMarkedAsIncorrectNotification(int ownerId, int userId, string userName, Multimedia? image, int solutionId, string? solutionContent, Multimedia? solutionMedia)
        {
            var notification = new Notification(ownerId, NotificationType.SolutionMarkedAsIncorrect, userId, userName, image)
            {
                CreatedAt = DateTime.UtcNow,
                SolutionId = solutionId,
                CommentContent = solutionContent,
                SolutionMedia = solutionMedia,
            };
            notification.AddDomainEvent(new NotificationCreatedDomainEvent(notification));
            return notification;
        }

        public static Notification SolutionVotedNotification(int ownerId, int userId, string userName, Multimedia? image, int solutionId, string? solutionContent, Multimedia? solutionMedia, SolutionVoteType solutionVoteType)
        {
            var notification = new Notification(ownerId, NotificationType.SolutionVotedNotification, userId, userName, image)
            {
                CreatedAt = DateTime.UtcNow,
                SolutionId = solutionId,
                CommentContent = solutionContent,
                SolutionMedia = solutionMedia,
                SolutionVoteType = solutionVoteType
            };
            notification.AddDomainEvent(new NotificationCreatedDomainEvent(notification));
            return notification;
        }

        public static Notification UserFollowedNotification(int ownerId, int userId, string userName, Multimedia? image)
        {
            var notification = new Notification(ownerId, NotificationType.UserFollowedNotification, userId, userName, image)
            {
                CreatedAt = DateTime.UtcNow,
            };
            notification.AddDomainEvent(new NotificationCreatedDomainEvent(notification));
            return notification;
        }

        public static Notification UserTaggedInComment(int ownerId, int userId, string userName, Multimedia? image, int? questionId, int? solutionId, int commentId, string commentContent)
        {
            var notification = new Notification(ownerId, NotificationType.UserTaggedInCommentNotification, userId, userName, image)
            {
                CreatedAt = DateTime.UtcNow,
                QuestionId = questionId,
                SolutionId = solutionId,
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
