using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents
{
    public record SolutionWasUpvotedDomainEvent(Solution Solution, SolutionUserVote Vote) : IDomainEvent;
}
