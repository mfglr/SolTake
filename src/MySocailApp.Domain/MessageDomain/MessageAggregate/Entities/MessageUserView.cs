using MySocailApp.Core;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Entities
{
    public class MessageUserView : Entity
    {
        public int MessageId { get; private set; }
        public int UserId { get; private set; }

        private MessageUserView(int userId) => UserId = userId;
        public static MessageUserView Create(int userId) => new(userId) { CreatedAt = DateTime.UtcNow };
    }
}
