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
        Task<Message?> GetMesssageWithRemovers(int id, CancellationToken cancellationToken);
        Task<List<Message>> GetMessagesWithRemovers(IEnumerable<int> messageIds, CancellationToken cancellationToken);
        Task<List<Message>> GetMessagesWithRemoverByUserIds(List<int> userIds, int accountId, CancellationToken cancellationToken);
        Task<List<Message>> GetUserMessages(int userId, CancellationToken cancellationToken);
    }
}
