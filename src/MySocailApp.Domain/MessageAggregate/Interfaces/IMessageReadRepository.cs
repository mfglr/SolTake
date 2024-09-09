using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageAggregate.Interfaces
{
    public interface IMessageReadRepository
    {
        Task<Message?> GetMessageWithImagesAsync(int id,CancellationToken cancellationToken);
    }
}
