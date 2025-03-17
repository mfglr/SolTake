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

        public void SetStateAsOnline()
        {
            UpdatedAt = DateTime.UtcNow;
            State = MessageConnectionState.Online;
            AddDomainEvent(new MessageConnectionStateChangedDomainEvent(this));
        }

        public void SetStateAsOfline()
        {
            UpdatedAt = DateTime.UtcNow;
            State = MessageConnectionState.Ofline;
            AddDomainEvent(new MessageConnectionStateChangedDomainEvent(this));
        }

        public void SetStateAsWriting(int typingId)
        {
            UpdatedAt = DateTime.UtcNow;
            TypingId = typingId;
            State = MessageConnectionState.Ofline;
            AddDomainEvent(new MessageConnectionStateChangedDomainEvent(this));
        }

    }
}
