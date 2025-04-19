using MySocailApp.Core;
using MySocailApp.Domain.FollowAggregate.Abstracts;
using MySocailApp.Domain.FollowAggregate.Entities;
using MySocailApp.Domain.FollowAggregate.Exceptions;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Domain.FollowAggregate.DomainServices
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
