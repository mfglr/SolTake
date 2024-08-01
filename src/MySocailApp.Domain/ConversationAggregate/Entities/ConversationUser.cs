using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.ConversationAggregate.Entities
{
    public class ConversationUser
    {
        public int ConversationId { get; private set; }
        public int AppUserId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private ConversationUser(int appUserId) => AppUserId = appUserId;

        public static ConversationUser Create(int appUserId)
            => new (appUserId) { CreatedAt = DateTime.UtcNow };

        //readonly navigator properties
        public Conversation Conversation { get; } = null!;
        public AppUser AppUser { get; } = null!;
    }
}
