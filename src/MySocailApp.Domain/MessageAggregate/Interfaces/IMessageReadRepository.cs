using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageAggregate.Interfaces
{
    public interface IMessageReadRepository
    {
        Task<Message?> GetMessageWithImagesAsync(int id,CancellationToken cancellationToken);
        Task<Message?> GetMessageByIdAsync(int id,CancellationToken cancellationToken);
        Task<List<Message>> GetMessagesByUserId(int userId1, int userId2, IPage pagination, CancellationToken cancellationToken);
        Task<List<Message>> GetConversationsAsync(int userId, int? lastId, int? take, CancellationToken cancellationToken);
        Task<List<Message>> GetUnviewedMessagesByReceiverId(int userId,CancellationToken cancellationToken);
    }
}
