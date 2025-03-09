using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Entities;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents
{
    public record CommentLikedDomainEvent(Comment Comment, CommentUserLike Like) : IDomainEvent;
}
