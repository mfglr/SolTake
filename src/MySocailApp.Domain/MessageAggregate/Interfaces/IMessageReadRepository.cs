using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageAggregate.Interfaces
{
    public interface IMessageReadRepository
    {
        Task<List<Message>> GetMessagesByUserId(int userId1, int userId2, int? lastId, int? take, CancellationToken cancellationToken);
    }
}
