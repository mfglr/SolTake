using SolTake.Domain.MessageConnectionAggregate.Entities;

namespace SolTake.Domain.MessageConnectionAggregate.Abstracts
{
    public interface IMessageConnectionReadRepository
    {
        Task<MessageConnection?> GetById(int id, CancellationToken cancellationToken);
        Task<List<MessageConnection>> GetByIds(IEnumerable<int> ids, CancellationToken cancellationToken);
        Task<List<string>> GetConnectionIdsByConnection(MessageConnection connection, CancellationToken cancellationToken);
    }
}
