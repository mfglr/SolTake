using MySocailApp.Core;

namespace MySocailApp.Domain.QuestionAggregate.Entities
{
    public class QuestionUserLike : Entity
    {
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; }

        private QuestionUserLike(int appUserId) => AppUserId = appUserId;
        public static QuestionUserLike Create(int appUserId) => new(appUserId) { CreatedAt = DateTime.UtcNow };
    }
}
