using SolTake.Domain.MessageUserReceiveAggregate.DomainEvents;
using SolTake.Core;

namespace SolTake.Domain.MessageUserReceiveAggregate.Entities
{
    public class MessageUserReceive : Entity, IAggregateRoot
    {
        public int MessageId { get; private set; }
        public int UserId { get; private set; }

        private MessageUserReceive(int messageId, int userId)
        {
            MessageId = messageId;
            UserId = userId;
        }

        public static MessageUserReceive Create(int messageId, int userId)
        {
            var mur = new MessageUserReceive(messageId, userId) { CreatedAt = DateTime.UtcNow };
            mur.AddDomainEvent(new MessageUserReceiveCreatedDomainEvent(mur));
            return mur;
        }
    }
}
