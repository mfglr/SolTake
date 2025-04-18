using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.DomainEvents
{
    public record CommentCreatedDomainEvent(Comment Comment, Login Login, Question? Question = null, Solution? Solution = null, Comment? Parent = null, Comment? Replied = null) : IDomainEvent;
}
