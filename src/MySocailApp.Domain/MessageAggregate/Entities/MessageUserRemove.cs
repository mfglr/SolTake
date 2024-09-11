using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.MessageAggregate.Entities
{
    public class MessageUserRemove
    {
        public int MessageId { get; private set; }
        public int AppUserId { get; private set; }

        private MessageUserRemove() { }

        public MessageUserRemove(int userId) => AppUserId = userId;

        public Message Message { get; } = null!;
        public AppUser AppUser { get; } = null!;
    }
}
