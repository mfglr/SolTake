using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentUserLikeAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.DomainEvents
{
    public record CommentLikedDomainEvent(Comment Comment, CommentUserLike Like, Login Login) : IDomainEvent;
}
