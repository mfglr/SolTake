using SolTake.Domain.UserAggregate.Exceptions;
using SolTake.Domain.UserUserBlockAggregate.Abstracts;
using SolTake.Core;
using SolTake.Domain.MessageAggregate.Entities;
using SolTake.Domain.MessageAggregate.Exceptions;

namespace SolTake.Domain.MessageAggregate.DomainServices
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
