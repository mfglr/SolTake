using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainEvents;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities
{
    public class QuestionUserLike : Entity, IAggregateRoot
    {
        public int QuestionId { get; private set; }
        public int UserId { get; private set; }

        private QuestionUserLike(int userId) => UserId = userId;
        public static QuestionUserLike Create(int userId)
        {
            var like = new QuestionUserLike(userId){ CreatedAt = DateTime.UtcNow };
            like.AddDomainEvent(new QuestionLikedDomainEvent(like));
            return like;
        }
    }
}
