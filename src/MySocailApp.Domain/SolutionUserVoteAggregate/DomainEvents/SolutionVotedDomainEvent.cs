using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionUserVoteAggregate.Entities;

namespace MySocailApp.Domain.SolutionUserVoteAggregate.DomainEvents
{
    public record SolutionVotedDomainEvent(Solution Solution, SolutionUserVote Vote, Login Login) : IDomainEvent;
}
