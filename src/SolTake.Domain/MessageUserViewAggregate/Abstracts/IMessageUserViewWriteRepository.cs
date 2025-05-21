using SolTake.Domain.MessageUserViewAggregate.Entities;

namespace SolTake.Domain.MessageUserViewAggregate.Abstracts
{
    public interface IMessageUserViewWriteRepository
    {
        Task CreateRangeAsync(IEnumerable<MessageUserView> messageUserViews, CancellationToken cancellationToken);
        void DeleteRange(IEnumerable<MessageUserView> messageUserViews);

        Task<List<MessageUserView>> GetByMessageIdAsync(int messageId, CancellationToken cancellationToken);
        Task<List<MessageUserView>> GetByUserIdAsync(int userId, CancellationToken cancellationToken);
    }
}
