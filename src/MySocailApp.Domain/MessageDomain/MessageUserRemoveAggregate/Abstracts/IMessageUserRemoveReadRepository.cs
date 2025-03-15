namespace MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Abstracts
{
    public interface IMessageUserRemoveReadRepository
    {
        Task<List<int>> GetUserIdsRemovedAsync(int messageId, CancellationToken cancellationToken);
        Task<bool> IsDeletedAllUsersAsync(int messageId,CancellationToken cancellationToken);
    }
}
