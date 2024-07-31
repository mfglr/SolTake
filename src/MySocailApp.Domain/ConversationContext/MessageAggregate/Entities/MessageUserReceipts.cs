namespace MySocailApp.Domain.ConversationContext.MessageAggregate.Entities
{
    public class MessageUserReceipts
    {
        public int MessageId { get; private set; }
        public int AppUserId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private MessageUserReceipts(int appUserId) => AppUserId = appUserId;

        public static MessageUserReceipts Create(int appUserId)
            => new(appUserId) { CreatedAt = DateTime.UtcNow };
    }
}
