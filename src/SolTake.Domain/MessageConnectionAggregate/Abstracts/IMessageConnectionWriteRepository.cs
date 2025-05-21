using SolTake.Domain.MessageConnectionAggregate.Entities;

namespace SolTake.Domain.MessageConnectionAggregate.Abstracts
{
    public interface IMessageConnectionWriteRepository
    {
        Task CreateAsync(MessageConnection userConnection, CancellationToken cancellationToken);
        Task<MessageConnection?> GetByIdAsync(int id, CancellationToken cancellationToken);
        void Delete(MessageConnection userConnection);
    }
}
