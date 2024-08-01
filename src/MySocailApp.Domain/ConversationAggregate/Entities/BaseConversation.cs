namespace MySocailApp.Domain.ConversationAggregate.Entities
{
    public abstract class BaseConversation
    {
        public int Id { get; protected set; }
        public DateTime CreatedAt { get; protected set; }
        public DateTime UpdatedAt { get; protected set; }
        public DateTime DateOfLastCreatedMessage { get; protected set; }

        protected readonly List<ConversationUser> _users = [];
        public IReadOnlyCollection<ConversationUser> Users => _users;
    }
}
