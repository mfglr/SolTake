using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageAggregate.Interfaces
{
    public interface IMessageReadRepository
    {
        Task<List<Message>> GetByConversationId(int conversationId, int? lastId, int? take, CancellationToken cancellationToken);
        Task<List<Message>> GetUnviewedMessagesByConversationId(int conversationId, CancellationToken cancellationToken);
    }
}
