using MySocailApp.Domain.ConversationContext.ConversationAggregate.Entities;

namespace MySocailApp.Domain.ConversationContext.ConversationAggregate.Interfaces
{
    public interface IConversationWriteRepository
    {
        Task CreateAsync(Conversation conversation, CancellationToken cancellationToken);
        Task<Conversation?> GetByIdAsync(int userId1, int userId2, CancellationToken cancellationToken);
    }
}
