using MySocailApp.Core;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities
{
    public class QuestionUserSave : Entity
    {
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; }

        private QuestionUserSave(int appUserId) => AppUserId = appUserId;
        public static QuestionUserSave Create(int appUserId) => new(appUserId) { CreatedAt = DateTime.UtcNow };
    }
}
