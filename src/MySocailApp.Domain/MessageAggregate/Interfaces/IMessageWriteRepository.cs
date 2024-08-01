using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageAggregate.Interfaces
{
    public interface IMessageWriteRepository
    {
        Task CreateAsync(Message message, CancellationToken cancellationToken);
        Task<Message?> GetById(int id, CancellationToken cancellationToken);
        Task<List<Message>> GetByIds(IEnumerable<int> ids, CancellationToken cancellationToken);
    }
}
