using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents
{
    public record SolutionDownvoteRemovedDomainEvent(Solution Solution) : IDomainEvent;
}
