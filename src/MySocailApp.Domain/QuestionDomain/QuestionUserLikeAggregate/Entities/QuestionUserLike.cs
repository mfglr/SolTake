using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainEvents;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Exceptions;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities
{
    public class QuestionUserLike : Entity, IAggregateRoot
    {
        public int QuestionId { get; private set; }
        public int UserId { get; private set; }
        public bool IsLiked { get; private set; }
        public DateTime LikedAt => UpdatedAt ?? CreatedAt;

        private QuestionUserLike(int userId) => UserId = userId;
        public static QuestionUserLike Create(int userId)
        {
            var like = new QuestionUserLike(userId){
                CreatedAt = DateTime.UtcNow,
                IsLiked = true
            };
            like.AddDomainEvent(new QuestionLikedDomainEvent(like));
            return like;
        }

        public void Dislike()
        {
            if(!IsLiked) throw new QuestionAlreadyDislikedException();
            IsLiked = false;
            UpdatedAt = DateTime.UtcNow;
        }

        public void Like()
        {
            if (IsLiked) throw new QuestionAlreadyLikedException();
            IsLiked = true;
            UpdatedAt = DateTime.UtcNow;
        }
    }
}
