using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts
{
    public interface IMessageReadRepository
    {
        Task<bool> ExistAsync(int messageId, CancellationToken cancellationToken);
        Task<Message?> GetByIdAsync(int messageId, CancellationToken cancellationToken);
        Task<int> GetMessageSenderIdAsync(int messageId, CancellationToken cancellationToken);
        Task<List<int>> GetMessageIdsByUserIds(List<int> userIds, int accountId, CancellationToken cancellationToken);

        Task<List<int>?> GetMessageUserIds(int messageId, CancellationToken cancellationToken);
        Task<bool> IsNotValidToRemoveForEveryone(IEnumerable<int> messageIds, int userId, CancellationToken cancellationToken);
        Task<bool> IsNotValidToRemove(IEnumerable<int> messageIds, int userId, CancellationToken cancellationToken);
    }
}
