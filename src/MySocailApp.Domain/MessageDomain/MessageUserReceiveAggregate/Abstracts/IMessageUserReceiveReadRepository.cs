using MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Abstracts
{
    public interface IMessageUserReceiveReadRepository
    {
        Task<bool> ExistAsync(int messageId, int userId, CancellationToken cancellationToken);
        Task<List<int>> GetIdOfMessagesNotReceivedByUser(IEnumerable<int> messageIds, int userId, CancellationToken cancellationToken);
    }
}
