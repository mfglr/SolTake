using MySocailApp.Core;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Entities
{
    public class QuestionUserSave : Entity, IAggregateRoot
    {
        public int QuestionId { get; private set; }
        public int UserId { get; private set; }

        private QuestionUserSave(int questionId, int userId)
        {
            QuestionId = questionId;
            UserId = userId;
        }
        public static QuestionUserSave Create(int questionId, int userId) => new(questionId, userId) { CreatedAt = DateTime.UtcNow };
    }
}
