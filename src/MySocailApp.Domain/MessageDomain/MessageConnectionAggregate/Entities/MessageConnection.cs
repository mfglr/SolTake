using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.ValueObjects;

namespace MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities
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
            => new (id, connectionId) { CreatedAt = DateTime.UtcNow };

        public void Connect(string connectionId)
        {
            UpdatedAt = DateTime.UtcNow;
            ConnectionId = connectionId;
            State = MessageConnectionState.Online;
        }

        public void ChangeState(MessageConnectionState state, int? userId = null)
        {
            UpdatedAt = DateTime.UtcNow;
            State = state;
            UserId = userId;

            if(state == MessageConnectionState.Ofline)
                LastSeenAt = (DateTime)UpdatedAt!;
        }
    }
}
