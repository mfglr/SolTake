using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts
{
    public interface IMessageReadRepository
    {
        Task<bool> ExistAsync(int messageId, CancellationToken cancellationToken);
        Task<Message?> GetByIdAsync(int messageId, CancellationToken cancellationToken);
    }
}
