using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.Entities
{
    public class QuestionUserLike
    {
        public DateTime CreatedAt { get; private set; }
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; }

        private QuestionUserLike(int questionId, int appUserId)
        {
            QuestionId = questionId;
            AppUserId = appUserId;
        }

        public static QuestionUserLike Create(int questionId, int appUserId)
            => new(questionId, appUserId) { CreatedAt = DateTime.UtcNow };

        public Question Question { get; }
        public AppUser AppUser { get; }
    }
}
