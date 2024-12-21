namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities
{
    public class QuestionUserLikeNotification(int appUserId)
    {
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; } = appUserId;
    }
}
