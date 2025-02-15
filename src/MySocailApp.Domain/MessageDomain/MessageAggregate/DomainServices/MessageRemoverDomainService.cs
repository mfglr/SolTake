using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.DomainServices
{
    public class MessageRemoverDomainService(IMessageWriteRepository messageWriteRepository, IUserWriteRepository userWriteRepository)
    {
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;

        public async Task RemoveAsync(Message message, int removerId, CancellationToken cancellationToken)
        {
            if (message.Removers.Count == 1 && message.Removers[0].UserId != removerId)
            {
                _messageWriteRepository.Delete(message);

                var user = await _userWriteRepository.GetByIdAsync(message.SenderId, cancellationToken); ;
                user?.AddDomainEvent(new MessageDeletedDomainEvent(message));
            }
            else
                message.Remove(removerId);
        }
    }
}
