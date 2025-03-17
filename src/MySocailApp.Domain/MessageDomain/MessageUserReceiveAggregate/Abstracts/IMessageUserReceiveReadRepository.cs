namespace MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Abstracts
{
    public interface IMessageUserReceiveReadRepository
    {
        Task<bool> ExistAsync(int messageId, int userId, CancellationToken cancellationToken);
    }
}
