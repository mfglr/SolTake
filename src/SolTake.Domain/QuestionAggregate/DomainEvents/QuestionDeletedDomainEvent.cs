using MySocailApp.Domain.QuestionAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.QuestionAggregate.DomainEvents
{
    public record QuestionDeletedDomainEvent(Question Question) : IDomainEvent;
}
