using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.DomainEvents;

namespace MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Entities
{
    public class SolutionUserVote(int solutionId, int userId, SolutionVoteType type) : Entity, IAggregateRoot
    {
        public int SolutionId { get; private set; } = solutionId;
        public int UserId { get; private set; } = userId;
        public SolutionVoteType Type { get; private set; } = type;

        internal void Create(Solution solution, Login login)
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new SolutionVotedDomainEvent(solution, this, login));
        }
    }
}
