using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.MessageAggregate.Entities
{
    public class MessageUserReceive
    {
        public int MessageId { get; private set; }
        public int AppUserId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private MessageUserReceive(int appUserId) => AppUserId = appUserId;

        public static MessageUserReceive Create(int appUserId)
            => new(appUserId) { CreatedAt = DateTime.UtcNow };

        //readonly navigator properties
        public Message Message { get; }
        public AppUser AppUser { get; }
    }
}
