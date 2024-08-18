using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.DomainEvents
{
    public record QuestionCommentCreatedDomainEvent(Comment Comment) : IDomainEvent;
}
