using SolTake.Domain.MessageUserViewAggregate.DomainEvents;
using SolTake.Core;

namespace SolTake.Domain.MessageUserViewAggregate.Entities
{
    public class MessageUserView : Entity
    {
        public int MessageId { get; private set; }
        public int UserId { get; private set; }

        private MessageUserView(int messageId, int userId)
        {
            MessageId = messageId;
            UserId = userId;
        }

        public static MessageUserView Create(int messageId, int userId)
        {
            var messageUserView = new MessageUserView(messageId, userId) { CreatedAt = DateTime.UtcNow };
            messageUserView.AddDomainEvent(new MessageUserViewCreatedDomainEvent(messageUserView));
            return messageUserView;
        }
    }
}
