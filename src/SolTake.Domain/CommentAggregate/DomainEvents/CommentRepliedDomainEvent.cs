using SolTake.Core;
using SolTake.Domain.CommentAggregate.Entities;

namespace SolTake.Domain.CommentAggregate.DomainEvents
{
    public record CommentRepliedDomainEvent(Comment Comment, Comment ParentComment, Comment RepliedComment) : IDomainEvent;
}
