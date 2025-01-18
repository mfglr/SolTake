using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.DomainEvents
{
    public record CommentRepliedDomainEvent(Comment Comment,Comment ParentComment,Comment RepliedComment) : IDomainEvent;
}
