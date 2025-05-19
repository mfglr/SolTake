using MySocailApp.Domain.MessageUserRemoveAggregate.Entities;

namespace MySocailApp.Domain.MessageUserRemoveAggregate.Abstracts
{
    public interface IMessageUserRemoveWriteRepository
    {
        Task CreateAsync(MessageUserRemove messageUserRemove, CancellationToken cancellationToken);
        Task CreateRangeAsync(IEnumerable<MessageUserRemove> messageUserRemoves, CancellationToken cancellationToken);
        void Delete(MessageUserRemove messageUserRemove);
        void DeleteRange(IEnumerable<MessageUserRemove> messageUserRemoves);

        Task<List<MessageUserRemove>> GetByUserId(int userId, CancellationToken cancellationToken);
        Task<List<MessageUserRemove>> GetByMessageId(int messageId, CancellationToken cancellationToken);
    }
}
