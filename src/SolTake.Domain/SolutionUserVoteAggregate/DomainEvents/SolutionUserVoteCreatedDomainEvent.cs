using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionUserVoteAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.SolutionUserVoteAggregate.DomainEvents
{
    public record SolutionUserVoteCreatedDomainEvent(Solution Solution, SolutionUserVote Vote, Login Login) : IDomainEvent;
}
