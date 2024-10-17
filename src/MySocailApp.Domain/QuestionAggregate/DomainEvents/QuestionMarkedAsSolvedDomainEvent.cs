using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.DomainEvents
{
    public record QuestionMarkedAsSolvedDomainEvent(Question Question, Solution Solution) : IDomainEvent;
}
