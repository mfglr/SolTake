using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Exceptions;

namespace MySocailApp.Domain.UserDomain.UserUserBlockAggregate.DomainServices
{
    public class UserUserBlockCreatorDomainService(IUserReadRepository userReadRepository, IUserUserBlockRepository userUserBlockRepository)
    {
        private readonly IUserReadRepository _userReadRepository = userReadRepository;
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;

        public async Task CreateAsync(UserUserBlock userUserBlock, CancellationToken cancellationToken)
        {
            var blocked =
                await _userReadRepository.GetByIdAsync(userUserBlock.BlockedId, cancellationToken) ??
                throw new UserNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(userUserBlock.BlockerId, userUserBlock.BlockedId, cancellationToken))
                throw new UserUserBlockAlreadyCreatedException();

            userUserBlock.Create();
        }
    }
}
