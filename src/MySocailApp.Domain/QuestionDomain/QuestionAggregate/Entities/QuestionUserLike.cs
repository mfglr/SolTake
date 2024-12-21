using MySocailApp.Core;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities
{
    public class QuestionUserLike : IHasId
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; }

        private QuestionUserLike(int appUserId) => AppUserId = appUserId;
        public static QuestionUserLike Create(int appUserId) => new(appUserId) { CreatedAt = DateTime.UtcNow };
    }
}
