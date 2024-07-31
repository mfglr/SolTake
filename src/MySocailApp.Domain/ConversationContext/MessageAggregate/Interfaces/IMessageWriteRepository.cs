using MySocailApp.Domain.ConversationContext.MessageAggregate.Entities;

namespace MySocailApp.Domain.ConversationContext.MessageAggregate.Interfaces
{
    public interface IMessageWriteRepository
    {
        Task CreateAsync(Message message, CancellationToken cancellationToken);
        Task<Message?> GetById(int id, CancellationToken cancellationToken);
        Task<List<Message>> GetByIds(IEnumerable<int> ids, CancellationToken cancellationToken);
    }
}
