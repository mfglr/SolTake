using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.DomainEvents;

namespace MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Entities
{
    public class UserUserBlock(int blockerId, int blockedId) : Entity, IAggregateRoot
    {
        public int BlockerId { get; private set; } = blockerId;
        public int BlockedId { get; private set; } = blockedId;

        public void Create()
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new UserUserBlockCreatedDomainEvent(this));
        }
    }
}
