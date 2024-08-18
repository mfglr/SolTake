namespace MySocailApp.Domain.NotificationAggregate.ValueObjects
{
    public enum NotificationType
    {
        QuestionCommentCreatedNotification,
        SolutionCommentCreatedNotification,
        ReplyCommentCreatedNotification,
        QuestionLikedNotification,
        CommentLikedNotification,
        SolutionCreatedNotification,
        UserTaggedCommentNotification
    }
}
