using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Interfaces
{
    public interface IMessageReadRepository
    {
        Task<Message?> GetMessageWithImagesAsync(int accountId, int id, CancellationToken cancellationToken);
    }
}
