using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.ValueObjects;

namespace MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities
{
    public class MessageConnection : Entity, IAggregateRoot
    {
        public string ConnectionId { get; private set; }
        public MessageConnectionState State { get; private set; }
        public int? TypingId { get; private set; }
        public bool IsOnline => State != MessageConnectionState.Ofline;

        private MessageConnection(int id, string connectionId)
        {
            Id = id;
            ConnectionId = connectionId;
        }

        public static MessageConnection Create(int id, string  messageConnectionId)
            => new (id, messageConnectionId) { CreatedAt = DateTime.UtcNow };

        public void ChangeState(MessageConnectionState state,int? typingId = null)
        {
            UpdatedAt = DateTime.UtcNow;
            State = state;
            TypingId = typingId;
            AddDomainEvent(new MessageConnectionStateChangedDomainEvent(this));
        }
    }
}
