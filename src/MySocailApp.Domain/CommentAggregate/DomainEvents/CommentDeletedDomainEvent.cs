using MySocailApp.Core;

namespace MySocailApp.Domain.CommentAggregate.DomainEvents
{
    public record CommentDeletedDomainEvent(int CommentId) : IDomainEvent;
}
