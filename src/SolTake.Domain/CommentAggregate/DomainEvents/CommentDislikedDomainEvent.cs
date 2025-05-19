using SolTake.Core;
using SolTake.Domain.CommentAggregate.Entities;

namespace SolTake.Domain.CommentAggregate.DomainEvents
{
    public record CommentDislikedDomainEvent(Comment Comment) : IDomainEvent;
}
