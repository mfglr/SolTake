using SolTake.Core;

namespace SolTake.Domain.UserUserConversationAggregate.Entities
{
    public class UserUserConversation(int converserId, int listenerId) : Entity, IAggregateRoot
    {
        public int ConverserId { get; private set; } = converserId;
        public int ListenerId { get; private set; } = listenerId;

        internal void Create() => CreatedAt = DateTime.UtcNow;
    }
}
