using MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.Abstracts
{
    public interface IMessageUserViewWriteRepository
    {
        Task CreateRangeAsync(IEnumerable<MessageUserView> messageUserViews, CancellationToken cancellationToken);
        void DeleteRange(IEnumerable<MessageUserView> messageUserViews);

        Task<List<MessageUserView>> GetByMessageIdAsync(int messageId, CancellationToken cancellationToken);
        Task<List<MessageUserView>> GetByUserIdAsync(int userId, CancellationToken cancellationToken);
    }
}
