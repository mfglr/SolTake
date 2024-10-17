using MySocailApp.Core;

namespace MySocailApp.Domain.MessageAggregate.Entities
{
    public class MessageUserView : Entity
    {
        public int MessageId { get; private set; }
        public int AppUserId { get; private set; }

        private MessageUserView(int appUserId) => AppUserId = appUserId;
        public static MessageUserView Create(int appUserId) => new(appUserId) { CreatedAt = DateTime.UtcNow };
    }
}
