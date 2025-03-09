using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.DomainEvents
{
    public record SolutionCommentCreatedDomainEvent(Solution Solution, Comment Comment) : IDomainEvent;
}
