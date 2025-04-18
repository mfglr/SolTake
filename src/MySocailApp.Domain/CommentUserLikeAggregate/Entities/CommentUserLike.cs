using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentUserLikeAggregate.Entities
{
    public class CommentUserLike(int commentId, int userId) : Entity, IAggregateRoot
    {
        public int CommentId { get; private set; } = commentId;
        public int UserId { get; private set; } = userId;

        internal void Create(Comment comment, Login login)
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new CommentLikedDomainEvent(comment, this, login));
        }
    }
}
