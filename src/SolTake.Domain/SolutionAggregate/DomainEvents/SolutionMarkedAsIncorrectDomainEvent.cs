using SolTake.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.SolutionAggregate.DomainEvents
{
    public record SolutionMarkedAsIncorrectDomainEvent(Question Question, Solution Solution, Login Login) : IDomainEvent;
}
