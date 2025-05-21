﻿namespace SolTake.Domain.NotificationDomain.NotificationAggregate.ValueObjects
{
    public enum NotificationType
    {
        QuestionCommentCreatedNotification,
        SolutionCommentCreatedNotification,
        CommentRepliedNotification,
        QuestionLikedNotification,
        CommentLikedNotification,
        SolutionCreatedNotification,
        UserTaggedInCommentNotification,
        UserFollowedNotification,
        SolutionMarkedAsIncorrect,
        SolutionMarkedAsCorrect,
        SolutionVotedNotification
    }
}
