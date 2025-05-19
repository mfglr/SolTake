using SolTake.Core;
using SolTake.Domain.CommentAggregate.Entities;
using SolTake.Domain.CommentUserLikeAggregate.Entities;

namespace SolTake.Domain.CommentAggregate.DomainEvents
{
    public record CommentLikedDomainEvent(Comment Comment, CommentUserLike Like, Login Login) : IDomainEvent;
}
