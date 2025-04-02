using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainEvents;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities
{
    public class QuestionUserLike(int questionId, int userId) : Entity, IAggregateRoot
    {
        public int QuestionId { get; private set; } = questionId;
        public int UserId { get; private set; } = userId;

        internal void Create(Question question,Login login)
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new QuestionLikedDomainEvent(question, this, login));
        }
    }
}
