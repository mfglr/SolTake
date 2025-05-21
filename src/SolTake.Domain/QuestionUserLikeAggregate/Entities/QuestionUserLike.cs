using SolTake.Domain.QuestionAggregate.Entities;
using SolTake.Domain.QuestionUserLikeAggregate.DomainEvents;
using SolTake.Core;

namespace SolTake.Domain.QuestionUserLikeAggregate.Entities
{
    public class QuestionUserLike(int questionId, int userId) : Entity, IAggregateRoot
    {
        public int QuestionId { get; private set; } = questionId;
        public int UserId { get; private set; } = userId;

        internal void Create(Question question, Login login)
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new QuestionLikedDomainEvent(question, this, login));
        }
    }
}
