using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.DomainEvents
{
    public record UserTaggedInCommentDomainEvent(Comment Comment,int UserId) : IDomainEvent;
}
