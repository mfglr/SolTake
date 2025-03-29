namespace MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.Abstracts
{
    public interface IMessageUserViewReadRepository
    {
        Task<List<int>> GetIdOfMessagesNotViewedByUser(IEnumerable<int> messageIds, int userId, CancellationToken cancellationToken);
    }
}
