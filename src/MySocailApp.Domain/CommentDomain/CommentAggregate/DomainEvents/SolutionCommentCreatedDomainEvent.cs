using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents
{
    public record SolutionCommentCreatedDomainEvent(Solution Solution, Comment Comment) : IDomainEvent;
}
