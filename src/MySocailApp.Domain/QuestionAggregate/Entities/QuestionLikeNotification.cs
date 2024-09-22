namespace MySocailApp.Domain.QuestionAggregate.Entities
{
    public class QuestionLikeNotification(int appUserId)
    {
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; } = appUserId;
    }
}
