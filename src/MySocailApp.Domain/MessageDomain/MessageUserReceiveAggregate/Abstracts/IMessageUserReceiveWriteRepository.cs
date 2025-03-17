using MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Abstracts
{
    public interface IMessageUserReceiveWriteRepository
    {
        Task CreateAsync(MessageUserReceive messageUserReceive,CancellationToken cancellationToken);
        void Delete(MessageUserReceive messageUserReceive);
        void DeleteRange(IEnumerable<MessageUserReceive> messageUserReceives);

        Task<List<MessageUserReceive>> GetByUserIdAsync(int userId,CancellationToken cancellationToken);
        Task<List<MessageUserReceive>> GetByMessageIdAsync(int messageId,CancellationToken cancellationToken);
    }
}
