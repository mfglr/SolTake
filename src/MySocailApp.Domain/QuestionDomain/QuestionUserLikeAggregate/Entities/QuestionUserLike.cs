using MySocailApp.Core;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities
{
    public class QuestionUserLike(int questionId, int userId) : Entity, IAggregateRoot
    {
        public int QuestionId { get; private set; } = questionId;
        public int UserId { get; private set; } = userId;

        internal void Create() => CreatedAt = DateTime.UtcNow;
    }
}
