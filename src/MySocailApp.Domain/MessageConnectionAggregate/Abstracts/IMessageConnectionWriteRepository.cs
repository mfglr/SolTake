using MySocailApp.Domain.MessageConnectionAggregate.Entities;

namespace MySocailApp.Domain.MessageConnectionAggregate.Abstracts
{
    public interface IMessageConnectionWriteRepository
    {
        Task CreateAsync(MessageConnection userConnection, CancellationToken cancellationToken);
        Task<MessageConnection?> GetByIdAsync(int id, CancellationToken cancellationToken);
        void Delete(MessageConnection userConnection);
    }
}
