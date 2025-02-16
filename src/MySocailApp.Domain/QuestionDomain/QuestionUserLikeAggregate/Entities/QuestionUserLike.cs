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
        public DateTime LikedAt { get; private set; }

        private QuestionUserLike(int userId) => UserId = userId;
        public static QuestionUserLike Create(int userId)
        {
            var date = DateTime.UtcNow;
            var like = new QuestionUserLike(userId){
                CreatedAt = date,
                LikedAt = date,
                IsLiked = true
            };
            like.AddDomainEvent(new QuestionLikedDomainEvent(like));
            return like;
        }

        public void Dislike()
        {
            if(!IsLiked)
                throw new QuestionAlreadyDislikedException();
            
            IsLiked = false;
            UpdatedAt = DateTime.UtcNow;
            AddDomainEvent(new QuestionDislikedDomainEvent(this));
        }

        public void Like()
        {
            if (IsLiked)
                throw new QuestionAlreadyLikedException();

            if (LikedAt.AddDays(1) > DateTime.UtcNow)
                AddDomainEvent(new QuestionLikedDomainEvent(this));

            IsLiked = true;
            UpdatedAt = LikedAt = DateTime.UtcNow;
        }
    }
}
