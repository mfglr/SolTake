using MySocailApp.Domain.QuestionUserLikeAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.QuestionUserLikeAggregate.DomainEvents
{
    public record QuestionDislikedDomainEvent(QuestionUserLike Like) : IDomainEvent;
}
