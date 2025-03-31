using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents
{
    public record QuestionCommentCreatedDomainEvent(Comment Comment, int QuestionUserId, Login Login) : IDomainEvent;
}
