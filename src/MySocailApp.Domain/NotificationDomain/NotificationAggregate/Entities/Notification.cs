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

        public void MarkAsViewed()
        {
            IsViewed = true;
            UpdatedAt = DateTime.UtcNow;
        }

        public void UpdateUserName(string userName)
        {
            UserName = userName;
            UpdatedAt = DateTime.UtcNow;
        }

        public void UpdateImage(Multimedia? image)
        {
            Image = image;
            UpdatedAt = DateTime.UtcNow;
        }


        //public int OwnerId { get; private set; }
        //public int UserId { get; private set; }
        //public bool IsViewed { get; private set; }
        //public NotificationType Type { get; private set; }
        //public int? ParentId { get; private set; }
        //public int? RepliedId { get; private set; }
        //public int? CommentId { get; private set; }
        //public int? QuestionId { get; private set; }
        //public int? SolutionId { get; private set; }

        //public void MarkAsViewed() => IsViewed = true;

        //private Notification(NotificationType type) => Type = type;

        //public static Notification QuestionCommentCreatedNotification(int ownerId, int userId, int commentId, int questionId)
        //    => new(NotificationType.QuestionCommentCreatedNotification)
        //    {
        //        OwnerId = ownerId,
        //        UserId = userId,
        //        CommentId = commentId,
        //        QuestionId = questionId,
        //        CreatedAt = DateTime.UtcNow,
        //    };

        //public static Notification SolutionCommentCreatedNotification(int ownerId, int userId, int commentId, int solutionId)
        //    => new(NotificationType.SolutionCommentCreatedNotification)
        //    {
        //        OwnerId = ownerId,
        //        UserId = userId,
        //        CommentId = commentId,
        //        SolutionId = solutionId,
        //        CreatedAt = DateTime.UtcNow,
        //    };

        //public static Notification CommentRepliedNotification(int ownerId, int userId, int commentId, int? questionId, int? solutionId, int parentId, int? repliedId)
        //    => new(NotificationType.CommentRepliedNotification)
        //    {
        //        OwnerId = ownerId,
        //        UserId = userId,
        //        ParentId = parentId,
        //        RepliedId = repliedId,
        //        CommentId = commentId,
        //        QuestionId = questionId,
        //        SolutionId = solutionId,
        //        CreatedAt = DateTime.UtcNow
        //    };

        //public static Notification QuestionLikedNotification(int ownerId, int questionId, int likerId)
        //    => new(NotificationType.QuestionLikedNotification)
        //    {
        //        OwnerId = ownerId,
        //        QuestionId = questionId,
        //        UserId = likerId,
        //        CreatedAt = DateTime.UtcNow,
        //    };

        //public static Notification CommentLikedNotification(int ownerId, int? questionId, int? solutionId, int? parentId, int commentId, int likerId)
        //    => new(NotificationType.CommentLikedNotification)
        //    {
        //        OwnerId = ownerId,
        //        QuestionId = questionId,
        //        SolutionId = solutionId,
        //        ParentId = parentId,
        //        CommentId = commentId,
        //        UserId = likerId,
        //        CreatedAt = DateTime.UtcNow,
        //    };


        //public static Notification SolutionCreatedNotification(int ownerId, int questionId, int solutionId, int userId)
        //    => new(NotificationType.SolutionCreatedNotification)
        //    {
        //        OwnerId = ownerId,
        //        QuestionId = questionId,
        //        SolutionId = solutionId,
        //        UserId = userId,
        //        CreatedAt = DateTime.UtcNow,
        //    };

        //public static Notification UserTaggedToCommentNotification(int ownerId, int userId, int commentId, int? questionId, int? solutionId, int? parentId)
        //    => new(NotificationType.UserTaggedCommentNotification)
        //    {
        //        OwnerId = ownerId,
        //        UserId = userId,
        //        QuestionId = questionId,
        //        SolutionId = solutionId,
        //        ParentId = parentId,
        //        CommentId = commentId,
        //        CreatedAt = DateTime.UtcNow,
        //    };

        //public static Notification UserFollowedNotification(int followerId, int followedId)
        //    => new(NotificationType.UserFollowedNotification)
        //    {
        //        OwnerId = followedId,
        //        UserId = followerId,
        //        CreatedAt = DateTime.UtcNow,
        //    };

        //public static Notification SolutionMarkedAsIncorrectNotification(int ownerId, int userId, int questionId, int solutionId)
        //    => new(NotificationType.SolutionMarkedAdIncorrect)
        //    {
        //        OwnerId = ownerId,
        //        UserId = userId,
        //        QuestionId = questionId,
        //        SolutionId = solutionId,
        //        CreatedAt = DateTime.UtcNow,
        //    };

        //public static Notification SolutionMarkedAsCorrectNotification(int ownerId, int userId, int questionId, int solutionId)
        //    => new(NotificationType.SolutionMarkedAsCorrect)
        //    {
        //        OwnerId = ownerId,
        //        UserId = userId,
        //        QuestionId = questionId,
        //        SolutionId = solutionId,
        //        CreatedAt = DateTime.UtcNow,
        //    };

        //public static Notification QuestionSolvedNotification(int ownerId, int userId, int questionId, int solutionId)
        //    => new(NotificationType.QuestionSolvedNotification)
        //    {
        //        OwnerId = ownerId,
        //        UserId = userId,
        //        QuestionId = questionId,
        //        SolutionId = solutionId,
        //        CreatedAt = DateTime.UtcNow,
        //    };

        //public static Notification SolutionWasUpvotedNotification(int ownerId, int userId, int questionId, int solutionId)
        //    => new(NotificationType.SolutionWasUpvotedNotification)
        //    {
        //        OwnerId = ownerId,
        //        UserId = userId,
        //        QuestionId = questionId,
        //        SolutionId = solutionId,
        //        CreatedAt = DateTime.UtcNow
        //    };

        //public static Notification SolutionWasDownvotedNotification(int ownerId, int userId, int questionId, int solutionId)
        //    => new(NotificationType.SolutionWasDownvotedNotification)
        //    {
        //        OwnerId = ownerId,
        //        UserId = userId,
        //        QuestionId = questionId,
        //        SolutionId = solutionId,
        //        CreatedAt = DateTime.UtcNow
        //    };
    }
}
