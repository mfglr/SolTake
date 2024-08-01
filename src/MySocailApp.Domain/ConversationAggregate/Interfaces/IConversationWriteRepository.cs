using MySocailApp.Domain.ConversationAggregate.Entities;

namespace MySocailApp.Domain.ConversationAggregate.Interfaces
{
    public interface IConversationWriteRepository
    {
        Task CreateAsync(Conversation conversation, CancellationToken cancellationToken);
        Task<Conversation?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<Conversation?> GetByUserIdsAsync(IEnumerable<int> ids, CancellationToken cancellationToken);
    }
}
