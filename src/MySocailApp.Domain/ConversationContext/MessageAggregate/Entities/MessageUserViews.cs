namespace MySocailApp.Domain.ConversationContext.MessageAggregate.Entities
{
    public class MessageUserViews
    {
        public int MessageId { get; private set; }
        public int AppUserId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private MessageUserViews(int appUserId) => AppUserId = appUserId;

        public static MessageUserViews Create(int appUserId)
            => new(appUserId) { CreatedAt = DateTime.UtcNow };
    }
}
