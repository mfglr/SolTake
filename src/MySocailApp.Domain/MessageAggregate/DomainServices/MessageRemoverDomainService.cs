using MySocailApp.Domain.AccountDomain.AccountAggregate.Abstracts;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Domain.MessageAggregate.DomainServices
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
