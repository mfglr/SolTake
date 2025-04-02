using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents
{
    public record UserTaggedInCommentDomainEvent(Comment Comment, int UserId, Question? Question = null, Solution? Solution = null, Comment? Parent = null) : IDomainEvent;
}
