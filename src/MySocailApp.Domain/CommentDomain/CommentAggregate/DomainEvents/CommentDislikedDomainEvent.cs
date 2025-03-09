using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents
{
    public record CommentDislikedDomainEvent(Comment Comment) : IDomainEvent;
}
