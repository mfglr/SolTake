using SolTake.Core;

namespace SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Entities
{
    public class QuestionUserSave : Entity, IAggregateRoot
    {
        public int QuestionId { get; private set; }
        public int UserId { get; private set; }

        public QuestionUserSave(int questionId, int userId)
        {
            QuestionId = questionId;
            UserId = userId;
        }
        
        internal void Create() => CreatedAt = DateTime.UtcNow;
    }
}
