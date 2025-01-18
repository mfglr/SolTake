using MySocailApp.Core;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities
{
    public class QuestionUserSave : Entity
    {
        public int QuestionId { get; private set; }
        public int UserId { get; private set; }

        private QuestionUserSave(int userId) => UserId = userId;
        public static QuestionUserSave Create(int userId) => new(userId) { CreatedAt = DateTime.UtcNow };
    }
}
