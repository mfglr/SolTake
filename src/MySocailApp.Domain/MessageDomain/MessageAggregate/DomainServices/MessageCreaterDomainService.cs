using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.DomainServices
{
    public class MessageCreaterDomainService(IUserReadRepository userReadRepository)
    {
        private readonly IUserReadRepository _userReadRepository = userReadRepository;

        public async Task CreateAsync(Message message, CancellationToken cancellationToken)
        {
            if (!await _userReadRepository.Exist(message.ReceiverId, cancellationToken))
                throw new ReceiverNotFoundException();
            message.Create();
        }
    }
}
