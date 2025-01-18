namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities
{
    public class QuestionUserLikeNotification(int userId)
    {
        public int QuestionId { get; private set; }
        public int UserId { get; private set; } = userId;
    }
}
