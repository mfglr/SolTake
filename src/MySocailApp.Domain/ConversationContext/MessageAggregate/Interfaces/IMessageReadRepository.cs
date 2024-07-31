using MySocailApp.Domain.ConversationContext.MessageAggregate.Entities;

namespace MySocailApp.Domain.ConversationContext.MessageAggregate.Interfaces
{
    public interface IMessageReadRepository
    {
        Task<List<Message>> GetByContactId(int userId1,int userId2,int? lastId,int? take,CancellationToken cancellationToken);
        Task<List<Message>> GetUnviewedMessagesByReceiverId(int receiverId,CancellationToken cancellationToken);
    }
}
