using MySocailApp.Domain.UserUserFollowAggregate.Exceptions;
using SolTake.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserUserFollowAggregate.Abstracts;
using MySocailApp.Domain.UserUserFollowAggregate.Entities;
using MySocailApp.Domain.UserUserBlockAggregate.Abstracts;
using SolTake.Core;

namespace MySocailApp.Domain.UserUserFollowAggregate.DomainServices
{
    public class UserUserFollowCreatorDomainService(IUserUserFollowReadRepository followReadRepository, IUserReadRepository userReadRepository, IUserUserBlockRepository userUserBlockRepository)
    {
        private readonly IUserUserFollowReadRepository _followReadRepository = followReadRepository;
        private readonly IUserReadRepository _userReadRepository = userReadRepository;
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;

        public async Task Follow(UserUserFollow follow, Login login, CancellationToken cancellationToken)
        {
            var followed =
                await _userReadRepository.GetByIdAsync(follow.FollowedId, cancellationToken) ??
                throw new UserNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(follow.FollowedId, follow.FollowerId, cancellationToken))
                throw new UserNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(follow.FollowerId, follow.FollowedId, cancellationToken))
                throw new UserBlockedException();

            if (await _followReadRepository.ExistAsync(follow.FollowerId, follow.FollowedId, cancellationToken))
                throw new UserIsAlreadyFollowedException();

            follow.Create(followed, login);

        }
    }
}
