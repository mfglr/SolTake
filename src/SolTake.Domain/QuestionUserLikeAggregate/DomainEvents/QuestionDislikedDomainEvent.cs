using SolTake.Domain.QuestionUserLikeAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.QuestionUserLikeAggregate.DomainEvents
{
    public record QuestionDislikedDomainEvent(QuestionUserLike Like) : IDomainEvent;
}
