using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents
{
    public record QuestionCommentCreatedDomainEvent(Question Question, Comment Comment) : IDomainEvent;
}
