using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;
using MySocailApp.Domain.UserAggregate.Exceptions;
using MySocailApp.Domain.UserUserBlockAggregate.Abstracts;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.DomainServices
{
    public class MessageCreatorDomainService(IUserUserBlockRepository userUserBlockRepository)
    {
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;

        public async Task CreateAsync(Message message, Login login, CancellationToken cancellationToken)
        {
            if (await _userUserBlockRepository.ExistAsync(message.ReceiverId, message.SenderId, cancellationToken))
                throw new UserNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(message.SenderId, message.ReceiverId, cancellationToken))
                throw new UserBlockedException();

            message.Create(login);
        }
    }
}
