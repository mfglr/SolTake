﻿using SolTake.Domain.UserUserBlockAggregate.DomainEvents;
using SolTake.Domain.UserUserBlockAggregate.Exceptions;
using SolTake.Core;

namespace SolTake.Domain.UserUserBlockAggregate.Entities
{
    public class UserUserBlock : Entity, IAggregateRoot
    {
        public int BlockerId { get; private set; }
        public int BlockedId { get; private set; }

        public UserUserBlock(int blockerId, int blockedId)
        {
            if (blockerId == blockedId)
                throw new PermissionDeniedToBlockSelf();

            BlockerId = blockerId;
            BlockedId = blockedId;
        }

        public void Create()
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new UserUserBlockCreatedDomainEvent(this));
        }
    }
}
