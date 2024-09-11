using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Domain.MessageAggregate.DomainServices
{
    public class MessageRemoverDomainService(IMessageWriteRepository messageWriteRepository)
    {
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;

        public void Remove(Message message,int removerId)
        {
            if(message.Removers.Count == 1 && message.Removers[0].AppUserId != removerId)
                _messageWriteRepository.Delete(message);
            else
                message.Remove(removerId);
        }
    }
}
