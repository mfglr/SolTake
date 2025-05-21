using SolTake.Domain.SolutionAggregate.Entities;
using SolTake.Domain.SolutionUserVoteAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.SolutionUserVoteAggregate.DomainEvents
{
    public record SolutionUserVoteCreatedDomainEvent(Solution Solution, SolutionUserVote Vote, Login Login) : IDomainEvent;
}
