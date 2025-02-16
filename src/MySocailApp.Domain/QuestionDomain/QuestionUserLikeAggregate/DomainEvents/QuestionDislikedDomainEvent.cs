using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainEvents
{
    public record QuestionDislikedDomainEvent(QuestionUserLike Like) : IDomainEvent;
}
