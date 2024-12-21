namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.ValueObjects
{
    public enum NotificationType
    {
        QuestionCommentCreatedNotification,
        SolutionCommentCreatedNotification,
        CommentRepliedNotification,
        QuestionLikedNotification,
        CommentLikedNotification,
        SolutionCreatedNotification,
        UserTaggedCommentNotification,
        UserFollowedNotification,
        SolutionMarkedAdIncorrect,
        SolutionMarkedAsCorrect,
        QuestionSolvedNotification,
        SolutionWasUpvotedNotification,
        SolutionWasDownvotedNotification
    }
}
