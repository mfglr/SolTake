using MySocailApp.Domain.SolutionAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.SolutionAggregate.DomainEvents
{
    public record SolutionDeletedDomainEvent(Solution Solution) : IDomainEvent;
}
