using SolTake.Core;
using SolTake.Domain.CommentAggregate.Entities;

namespace SolTake.Domain.CommentAggregate.DomainEvents
{
    public record SolutionCommentCreatedDomainEvent(Comment Comment, int SolutionUserId, Login Login) : IDomainEvent;
}
