﻿using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionUserVoteAggregate.DomainEvents;

namespace MySocailApp.Domain.SolutionUserVoteAggregate.Entities
{
    public class SolutionUserVote(int solutionId, int userId, SolutionVoteType type) : Entity, IAggregateRoot
    {
        public int SolutionId { get; private set; } = solutionId;
        public int UserId { get; private set; } = userId;
        public SolutionVoteType Type { get; private set; } = type;

        internal void Create(Solution solution, Login login)
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new SolutionUserVoteCreatedDomainEvent(solution, this, login));
        }
    }
}
