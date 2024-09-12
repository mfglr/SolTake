using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageAggregate.Interfaces
{
    public interface IMessageWriteRepository
    {
        Task CreateAsync(Message message, CancellationToken cancellationToken);
        void Delete(Message message);
        Task<Message?> GetById(int id, CancellationToken cancellationToken);
        Task<List<Message>> GetByIds(IEnumerable<int> ids, CancellationToken cancellationToken);
        Task<Message?> GetMesssageWithRemovers(int id, CancellationToken cancellationToken);
        Task<List<Message>> GetMessagesWithRemovers(IEnumerable<int> messageIds, CancellationToken cancellationToken);
    }
}
