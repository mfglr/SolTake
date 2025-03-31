using MySocailApp.Core;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Entities
{
    public class QuestionUserLikeNotification : IAggregateRoot
    {
        public int QuestionId { get; private set; }
        public int UserId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private QuestionUserLikeNotification(int questionId, int userId)
        {
            QuestionId = questionId;
            UserId = userId;
        }

        public static QuestionUserLikeNotification Create(int  questionId, int userId) =>
            new(questionId, userId) { CreatedAt = DateTime.UtcNow };

        public bool IsValidDate() => DateTime.UtcNow > CreatedAt.AddDays(1);

        public void UpdateCreatedAt() => CreatedAt = DateTime.UtcNow;
    }
}
