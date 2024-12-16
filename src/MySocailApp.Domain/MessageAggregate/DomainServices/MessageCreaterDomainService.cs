using MySocailApp.Domain.AccountDomain.AccountAggregate.Abstracts;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Domain.MessageAggregate.DomainServices
{
    public class MessageCreaterDomainService(IMessageWriteRepository messageWriteRepository, IAccountReadRepository accountReadRepository)
    {
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;

        public async Task CreateAsync(Message message, CancellationToken cancellationToken)
        {
            if (!await _accountReadRepository.Exist(message.ReceiverId,cancellationToken))
                throw new ReceiverNotFoundException();
            message.Create();
            await _messageWriteRepository.CreateAsync(message, cancellationToken);
        }
    }
}
