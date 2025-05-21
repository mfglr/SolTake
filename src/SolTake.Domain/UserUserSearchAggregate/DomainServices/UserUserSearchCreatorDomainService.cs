using SolTake.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserUserBlockAggregate.Abstracts;
using MySocailApp.Domain.UserUserSearchAggregate.Abstracts;
using MySocailApp.Domain.UserUserSearchAggregate.Entities;
using MySocailApp.Domain.UserUserSearchAggregate.Exceptions;

namespace MySocailApp.Domain.UserUserSearchAggregate.DomainServices
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
