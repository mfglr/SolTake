using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionAggregate.DomainEvents
{
    public record SolutionDeletedDomainEvent(Solution Solution) : IDomainEvent;
}
