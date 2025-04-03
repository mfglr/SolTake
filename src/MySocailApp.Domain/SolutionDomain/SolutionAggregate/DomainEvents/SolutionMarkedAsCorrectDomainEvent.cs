using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents
{
    public record SolutionMarkedAsCorrectDomainEvent(Question Question, Solution Solution, Login Login) : IDomainEvent;
}
