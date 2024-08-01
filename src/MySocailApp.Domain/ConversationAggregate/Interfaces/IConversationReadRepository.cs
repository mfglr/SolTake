using MySocailApp.Domain.ConversationAggregate.Entities;

namespace MySocailApp.Domain.ConversationAggregate.Interfaces
{
    public interface IConversationReadRepository
    {
        Task<Conversation?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Conversation>> GetConversationsThatHaveUnviewedMessages(int userId, CancellationToken cancellationToken);
        Task<List<Conversation>> GetConversationsAsync(int userId, DateTime? lastDate, int? take, int? takeMessage, CancellationToken cancellationToken);
        Task<Conversation?> GetByUserIdsAsync(IEnumerable<int> ids, int? takeMessage, CancellationToken cancellationToken);
    }
}
