using MySocailApp.Domain.AccountDomain.AccountAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.DomainServices
{
    public class MessageCreaterDomainService(IMessageWriteRepository messageWriteRepository, IAccountReadRepository accountReadRepository)
    {
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;

        public async Task CreateAsync(Message message, CancellationToken cancellationToken)
        {
            if (!await _accountReadRepository.Exist(message.ReceiverId, cancellationToken))
                throw new ReceiverNotFoundException();
            message.Create();
            await _messageWriteRepository.CreateAsync(message, cancellationToken);
        }
    }
}
