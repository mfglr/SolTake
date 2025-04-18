using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.DomainEvents
{
    public record SolutionCommentCreatedDomainEvent(Comment Comment, int SolutionUserId, Login Login) : IDomainEvent;
}
