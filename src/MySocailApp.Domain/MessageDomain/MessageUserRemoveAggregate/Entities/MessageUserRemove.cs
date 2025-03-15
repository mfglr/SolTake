using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.DomainEvents;

namespace MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Entities
{
    public class MessageUserRemove : Entity, IAggregateRoot
    {
        public int MessageId { get; private set; }
        public int UserId { get; private set; }

        private MessageUserRemove(int messageId, int userId)
        {
            MessageId = messageId;
            UserId = userId;
        }
        public static MessageUserRemove Create(int messageId, int removeId)
        {
            var messagUserRemove = new MessageUserRemove(messageId, removeId) { CreatedAt = DateTime.UtcNow };
            messagUserRemove.AddDomainEvent(new MessageUserRemoveCreatedDomainEvent(messagUserRemove));
            return messagUserRemove;
        }
    }
}
