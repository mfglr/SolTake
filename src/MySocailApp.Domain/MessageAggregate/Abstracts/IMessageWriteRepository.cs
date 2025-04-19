using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts
{
    public interface IMessageWriteRepository
    {
        Task CreateAsync(Message message, CancellationToken cancellationToken);
        void Delete(Message message);
        void DeleteRange(IEnumerable<Message> messages);
        Task<Message?> GetById(int id, CancellationToken cancellationToken);
        Task<List<Message>> GetByIds(IEnumerable<int> ids, CancellationToken cancellationToken);

        Task<List<Message>> GetUserMessages(int userId, CancellationToken cancellationToken);
    }
}
