using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents
{
    public record SolutionCommentCreatedDomainEvent(Comment Comment, int SolutionUserId, Login Login) : IDomainEvent;
}
