using MySocailApp.Core;

namespace MySocailApp.Domain.MessageAggregate.Entities
{
    public class MessageUserReceive : Entity
    {
        public int MessageId { get; private set; }
        public int AppUserId { get; private set; }

        private MessageUserReceive(int appUserId) => AppUserId = appUserId;
        public static MessageUserReceive Create(int appUserId) => new(appUserId) { CreatedAt = DateTime.UtcNow };
    }
}
