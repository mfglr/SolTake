using SolTake.Domain.QuestionAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.QuestionAggregate.DomainEvents
{
    public record QuestionDeletedDomainEvent(Question Question) : IDomainEvent;
}
