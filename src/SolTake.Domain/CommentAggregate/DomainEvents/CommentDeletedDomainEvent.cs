using SolTake.Core;
using SolTake.Domain.CommentAggregate.Entities;

namespace SolTake.Domain.CommentAggregate.DomainEvents
{
    public record CommentDeletedDomainEvent(Comment Comment) : IDomainEvent;
}
