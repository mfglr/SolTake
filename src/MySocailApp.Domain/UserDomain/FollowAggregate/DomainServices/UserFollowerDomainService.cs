using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.FollowAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.FollowAggregate.Entities;
using MySocailApp.Domain.UserDomain.FollowAggregate.Exceptions;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Domain.UserDomain.FollowAggregate.DomainServices
{
    public class UserFollowerDomainService(IFollowReadRepository followReadRepository, IUserReadRepository userReadRepository)
    {
        private readonly IFollowReadRepository _followReadRepository = followReadRepository;
        private readonly IUserReadRepository _userReadRepository = userReadRepository;

        public async Task Follow(Follow follow, Login login, CancellationToken cancellationToken)
        {
            var followed =
                await _userReadRepository.GetByIdAsync(follow.FollowedId, cancellationToken) ??
                throw new UserNotFoundException();

            if (await _followReadRepository.ExistAsync(follow.FollowerId, follow.FollowedId, cancellationToken))
                throw new UserIsAlreadyFollowedException();

            follow.Create(followed, login);

        }
    }
}
