using SolTake.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.QuestionAggregate.DomainEvents
{
    public record QuestionSolvedDomainEvent(Question Question, Solution solution) : IDomainEvent;
}
