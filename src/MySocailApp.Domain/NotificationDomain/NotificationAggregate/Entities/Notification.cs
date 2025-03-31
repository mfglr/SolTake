﻿using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.ValueObjects;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities
{
    public class Notification : Entity, IAggregateRoot
    {
        public int OwnerId { get; private set; }
        public int UserId { get; private set; }
        public bool IsViewed { get; private set; }
        public NotificationType Type { get; private set; }
        public int? ParentId { get; private set; }
        public int? RepliedId { get; private set; }
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

        public static Notification CommentRepliedNotification(int ownerId, int userId, int commentId, int? questionId, int? solutionId, int parentId, int? repliedId)
            => new(NotificationType.CommentRepliedNotification)
            {
                OwnerId = ownerId,
                UserId = userId,
                ParentId = parentId,
                RepliedId = repliedId,
                CommentId = commentId,
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

        public static Notification CommentLikedNotification(int ownerId, int? questionId, int? solutionId, int? parentId, int commentId, int likerId)
            => new(NotificationType.CommentLikedNotification)
            {
                OwnerId = ownerId,
                QuestionId = questionId,
                SolutionId = solutionId,
                ParentId = parentId,
                CommentId = commentId,
                UserId = likerId,
                CreatedAt = DateTime.UtcNow,
            };


        public static Notification SolutionCreatedNotification(int ownerId, int questionId, int solutionId, int userId)
            => new(NotificationType.SolutionCreatedNotification)
            {
                OwnerId = ownerId,
                QuestionId = questionId,
                SolutionId = solutionId,
                UserId = userId,
                CreatedAt = DateTime.UtcNow,
            };

        public static Notification UserTaggedToCommentNotification(int ownerId, int userId, int commentId, int? questionId, int? solutionId, int? parentId)
            => new(NotificationType.UserTaggedCommentNotification)
            {
                OwnerId = ownerId,
                UserId = userId,
                QuestionId = questionId,
                SolutionId = solutionId,
                ParentId = parentId,
                CommentId = commentId,
                CreatedAt = DateTime.UtcNow,
            };

        public static Notification UserFollowedNotification(int followerId, int followedId)
            => new(NotificationType.UserFollowedNotification)
            {
                OwnerId = followedId,
                UserId = followerId,
                CreatedAt = DateTime.UtcNow,
            };

        public static Notification SolutionMarkedAsIncorrectNotification(int ownerId, int userId, int questionId, int solutionId)
            => new(NotificationType.SolutionMarkedAdIncorrect)
            {
                OwnerId = ownerId,
                UserId = userId,
                QuestionId = questionId,
                SolutionId = solutionId,
                CreatedAt = DateTime.UtcNow,
            };

        public static Notification SolutionMarkedAsCorrectNotification(int ownerId, int userId, int questionId, int solutionId)
            => new(NotificationType.SolutionMarkedAsCorrect)
            {
                OwnerId = ownerId,
                UserId = userId,
                QuestionId = questionId,
                SolutionId = solutionId,
                CreatedAt = DateTime.UtcNow,
            };

        public static Notification QuestionSolvedNotification(int ownerId, int userId, int questionId, int solutionId)
            => new(NotificationType.QuestionSolvedNotification)
            {
                OwnerId = ownerId,
                UserId = userId,
                QuestionId = questionId,
                SolutionId = solutionId,
                CreatedAt = DateTime.UtcNow,
            };

        public static Notification SolutionWasUpvotedNotification(int ownerId, int userId, int questionId, int solutionId)
            => new(NotificationType.SolutionWasUpvotedNotification)
            {
                OwnerId = ownerId,
                UserId = userId,
                QuestionId = questionId,
                SolutionId = solutionId,
                CreatedAt = DateTime.UtcNow
            };

        public static Notification SolutionWasDownvotedNotification(int ownerId, int userId, int questionId, int solutionId)
            => new(NotificationType.SolutionWasDownvotedNotification)
            {
                OwnerId = ownerId,
                UserId = userId,
                QuestionId = questionId,
                SolutionId = solutionId,
                CreatedAt = DateTime.UtcNow
            };
    }
}
