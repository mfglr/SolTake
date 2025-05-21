using SolTake.Domain.MessageUserReceiveAggregate.Entities;

namespace SolTake.Domain.MessageUserReceiveAggregate.Abstracts
{
    public interface IMessageUserReceiveWriteRepository
    {
        Task CreateAsync(MessageUserReceive messageUserReceive, CancellationToken cancellationToken);
        Task CreateRangeAsync(IEnumerable<MessageUserReceive> messageUserRecives, CancellationToken cancellationToken);
        void Delete(MessageUserReceive messageUserReceive);
        void DeleteRange(IEnumerable<MessageUserReceive> messageUserReceives);

        Task<List<MessageUserReceive>> GetByUserIdAsync(int userId, CancellationToken cancellationToken);
        Task<List<MessageUserReceive>> GetByMessageIdAsync(int messageId, CancellationToken cancellationToken);
    }
}
