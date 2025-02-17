using MySocailApp.Core;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities
{
    public class QuestionUserLike : Entity, IAggregateRoot
    {
        public int QuestionId { get; private set; }
        public int UserId { get; private set; }

        private QuestionUserLike(int questionId, int userId)
        {
            UserId = userId;
            QuestionId = questionId;
        }
        
        public static QuestionUserLike Create(int questionId,int userId) => new (questionId,userId){ CreatedAt = DateTime.UtcNow };
    }
}
