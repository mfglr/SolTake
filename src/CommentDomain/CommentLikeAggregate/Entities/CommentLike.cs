using CommentDomain.CommentLikeAggregate.ValueObjects;
using MySocailApp.Core;

namespace CommentDomain.CommentLikeAggregate.Entities
{
    public class CommentLike : Entity
    {
        public int CommentId { get; private set; }
        public int UserId { get; private set; }
        public CommentLikeState State { get; private set; }

        private CommentLike(int userId)
        {
            UserId = userId;
            State = CommentLikeState.Liked;
        }
        public static CommentLike Create(int userId)
        {
            var like = new CommentLike(userId) { CreatedAt = DateTime.UtcNow };
            //like.AddDomainEvent(new CommentLikedDomainEvent())
            return like;
        }
        public void Like()
        {
            if (State == CommentLikeState.Liked)
                return;
            State = CommentLikeState.Liked;
            UpdatedAt = DateTime.UtcNow;
        }
        public void Dislike()
        {
            if (State == CommentLikeState.Disliked)
                return;
            State = CommentLikeState.Disliked;
            UpdatedAt = DateTime.UtcNow;
        }
    }
}
