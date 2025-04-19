using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents
{
    public record SolutionCreatedDomainEvent(Question Question, Solution Solution,Login Login) : IDomainEvent;
}
