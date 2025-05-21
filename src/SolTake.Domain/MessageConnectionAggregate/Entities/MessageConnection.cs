using SolTake.Core;
using SolTake.Domain.MessageConnectionAggregate.ValueObjects;

namespace SolTake.Domain.MessageConnectionAggregate.Entities
{
    public class MessageConnection : Entity, IAggregateRoot
    {
        public string ConnectionId { get; private set; }
        public MessageConnectionState State { get; private set; }
        public int? UserId { get; private set; }
        public DateTime LastSeenAt { get; private set; }

        private MessageConnection(int id, string connectionId)
        {
            Id = id;
            ConnectionId = connectionId;
        }

        public static MessageConnection Create(int id, string connectionId)
            => new(id, connectionId) { CreatedAt = DateTime.UtcNow };

        public void Connect(string connectionId)
        {
            UpdatedAt = DateTime.UtcNow;
            ConnectionId = connectionId;
            State = MessageConnectionState.Online;
            UserId = null;
        }

        public void ChangeStateToOnline()
        {
            UpdatedAt = DateTime.UtcNow;
            State = MessageConnectionState.Online;
            UserId = null;
        }

        public void ChangeStateToOfline()
        {
            UpdatedAt = LastSeenAt = DateTime.UtcNow;
            State = MessageConnectionState.Ofline;
            UserId = null;
        }

        public void ChangeStateToFocused(int userId)
        {
            UpdatedAt = DateTime.UtcNow;
            State = MessageConnectionState.Focused;
            UserId = userId;
        }

        public void ChangeStateToTyping(int userId)
        {
            UpdatedAt = DateTime.UtcNow;
            State = MessageConnectionState.Typing;
            UserId = userId;
        }

        public void Disconnect()
        {
            UpdatedAt = LastSeenAt = DateTime.UtcNow;
            State = MessageConnectionState.Ofline;
            UserId = null;
        }
    }
}
