using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;
using SolTake.Core;
using SolTake.Domain.CommentAggregate.Entities;

namespace SolTake.Domain.CommentAggregate.DomainEvents
{
    public record UserTaggedInCommentDomainEvent(Comment Comment, int UserId, Question? Question = null, Solution? Solution = null, Comment? Parent = null, Comment? Replied = null) : IDomainEvent;
}
