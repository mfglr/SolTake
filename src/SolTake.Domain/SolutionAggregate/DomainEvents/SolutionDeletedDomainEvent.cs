using MySocailApp.Domain.SolutionAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.SolutionAggregate.DomainEvents
{
    public record SolutionDeletedDomainEvent(Solution Solution) : IDomainEvent;
}
