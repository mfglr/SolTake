using SolTake.Core;
using SolTake.Domain.QuestionAggregate.Entities;

namespace SolTake.Domain.QuestionAggregate.DomainEvents
{
    public record QuestionPublishedDomainEvent(Question Question) : IDomainEvent;
}
