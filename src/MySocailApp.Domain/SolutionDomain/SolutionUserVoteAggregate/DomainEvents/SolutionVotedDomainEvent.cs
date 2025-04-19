using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Entities;

namespace MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.DomainEvents
{
    public record SolutionVotedDomainEvent(Solution Solution, SolutionUserVote Vote, Login Login) : IDomainEvent;
}
