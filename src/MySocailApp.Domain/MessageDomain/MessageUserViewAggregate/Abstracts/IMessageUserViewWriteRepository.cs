using MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.Abstracts
{
    public interface IMessageUserViewWriteRepository
    {
        Task CreateRangeAsync(IEnumerable<MessageUserView> messageUserViews, CancellationToken cancellationToken);
    }
}
