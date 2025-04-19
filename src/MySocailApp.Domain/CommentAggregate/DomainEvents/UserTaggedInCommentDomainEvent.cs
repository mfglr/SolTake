using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.DomainEvents
{
    public record UserTaggedInCommentDomainEvent(Comment Comment, int UserId, Question? Question = null, Solution? Solution = null, Comment? Parent = null, Comment? Replied = null) : IDomainEvent;
}
