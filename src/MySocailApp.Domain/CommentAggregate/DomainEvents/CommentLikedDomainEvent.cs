using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.DomainEvents
{
    public record CommentLikedDomainEvent(Comment Comment,int LikerId) : IDomainEvent;
}
