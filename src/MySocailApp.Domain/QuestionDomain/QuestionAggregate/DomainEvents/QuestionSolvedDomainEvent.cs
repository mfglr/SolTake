using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.DomainEvents
{
    public record QuestionSolvedDomainEvent(Question Question, Solution solution) : IDomainEvent;
}
