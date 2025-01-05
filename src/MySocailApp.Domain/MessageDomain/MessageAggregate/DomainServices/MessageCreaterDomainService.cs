using MySocailApp.Domain.AccountDomain.AccountAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.DomainServices
{
    public class MessageCreaterDomainService(IAccountReadRepository accountReadRepository)
    {
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;

        public async Task CreateAsync(Message message, CancellationToken cancellationToken)
        {
            if (!await _accountReadRepository.Exist(message.ReceiverId, cancellationToken))
                throw new ReceiverNotFoundException();
            message.Create();
        }
    }
}
