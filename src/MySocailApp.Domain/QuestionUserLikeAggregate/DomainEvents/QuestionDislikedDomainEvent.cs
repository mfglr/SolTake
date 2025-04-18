using MySocailApp.Core;
using MySocailApp.Domain.QuestionUserLikeAggregate.Entities;

namespace MySocailApp.Domain.QuestionUserLikeAggregate.DomainEvents
{
    public record QuestionDislikedDomainEvent(QuestionUserLike Like) : IDomainEvent;
}
