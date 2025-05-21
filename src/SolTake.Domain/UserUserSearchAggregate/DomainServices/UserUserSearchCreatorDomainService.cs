using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserUserBlockAggregate.Abstracts;
using SolTake.Domain.UserUserSearchAggregate.Abstracts;
using SolTake.Domain.UserUserSearchAggregate.Entities;
using SolTake.Domain.UserUserSearchAggregate.Exceptions;

namespace SolTake.Domain.UserUserSearchAggregate.DomainServices
{
    public class UserUserSearchCreatorDomainService(IUserReadRepository userReadRepository, IUserUserBlockRepository userUserBlockRepository, IUserUserSearchWriteRepository userUserSearchWriteRepository)
    {
        private readonly IUserReadRepository _userReadRepository = userReadRepository;
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;
        private readonly IUserUserSearchWriteRepository _userUserSearchWriteRepository = userUserSearchWriteRepository;

        public async Task CreateAsync(UserUserSearch userUserSearch, CancellationToken cancellationToken)
        {
            var user =
                await _userReadRepository.GetByIdAsync(userUserSearch.SearchedId, cancellationToken) ??
                throw new UserNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(userUserSearch.SearchedId, userUserSearch.SearcherId, cancellationToken))
                throw new UserNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(userUserSearch.SearcherId, userUserSearch.SearcherId, cancellationToken))
                throw new UserBlockedException();

            var prev = await _userUserSearchWriteRepository.GetAsync(userUserSearch.SearcherId, userUserSearch.SearchedId, cancellationToken);
            if (prev != null)
                _userUserSearchWriteRepository.Delete(prev);

            userUserSearch.Create();
        }
    }
}
