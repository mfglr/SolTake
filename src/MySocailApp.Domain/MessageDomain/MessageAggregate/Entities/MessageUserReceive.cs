using MySocailApp.Core;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Entities
{
    public class MessageUserReceive : Entity
    {
        public int MessageId { get; private set; }
        public int UserId { get; private set; }

        private MessageUserReceive(int userId) => UserId = userId;
        public static MessageUserReceive Create(int userId) => new(userId) { CreatedAt = DateTime.UtcNow };
    }
}
