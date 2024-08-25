using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionAggregate.DomainEvents
{
    public record SolutionWasDownvotedDomainEvent(Solution Solution,int VoterId) : IDomainEvent;
}
