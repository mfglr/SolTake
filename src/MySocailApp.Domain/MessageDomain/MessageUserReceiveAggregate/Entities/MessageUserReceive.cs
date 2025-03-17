using MySocailApp.Core;

namespace MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Entities
{
    public class MessageUserReceive : Entity, IAggregateRoot
    {
        public int MessageId { get; private set; }
        public int UserId { get; private set; }

        private MessageUserReceive(int messageId, int userId) => UserId = userId;
        public static MessageUserReceive Create(int messageId, int userId) {
            var receive = new MessageUserReceive(messageId, userId) { CreatedAt = DateTime.UtcNow };
            return receive;
        }
    }
}
