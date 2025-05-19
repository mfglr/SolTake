namespace MySocailApp.Domain.MessageUserReceiveAggregate.Abstracts
{
    public interface IMessageUserReceiveReadRepository
    {
        Task<bool> ExistAsync(int messageId, int userId, CancellationToken cancellationToken);
        Task<List<int>> GetIdOfMessagesNotReceivedByUser(IEnumerable<int> messageIds, int userId, CancellationToken cancellationToken);
    }
}
