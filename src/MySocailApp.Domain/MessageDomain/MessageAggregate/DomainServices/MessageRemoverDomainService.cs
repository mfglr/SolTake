using AccountDomain.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.DomainServices
{
    public class MessageRemoverDomainService(IMessageWriteRepository messageWriteRepository, IAccountWriteRepository accountWriteRepository)
    {
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;

        public async Task RemoveAsync(Message message, int removerId, CancellationToken cancellationToken)
        {
            if (message.Removers.Count == 1 && message.Removers[0].UserId != removerId)
            {
                _messageWriteRepository.Delete(message);

                var account = await _accountWriteRepository.GetAccountAsync(message.SenderId, cancellationToken); ;
                account?.AddDomainEvent(new MessageDeletedDomainEvent(message));
            }
            else
                message.Remove(removerId);
        }
    }
}
