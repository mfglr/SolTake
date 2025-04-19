using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.DomainEvents
{
    public record QuestionSolvedDomainEvent(Question Question, Solution solution) : IDomainEvent;
}
