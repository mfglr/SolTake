using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Domain.ConversationAggregate.Entities
{
    public class Conversation : IAggregateRoot
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }
        public DateTime LastMessageCreatedAt { get; private set; }

        private readonly List<ConversationUser> _users = [];
        public IReadOnlyCollection<ConversationUser> Users => _users;

        internal void Create(int userId1, int userId2)
        {
            _users.Add(ConversationUser.Create(userId1));
            _users.Add(ConversationUser.Create(userId2));
            UpdatedAt = CreatedAt = DateTime.UtcNow;
        }

        internal void UpdateLastMessageCreateAt() => LastMessageCreatedAt = DateTime.UtcNow;

        //readonly navigator properties
        public IReadOnlyCollection<Message> Messages { get; } = null!;
    }
}
