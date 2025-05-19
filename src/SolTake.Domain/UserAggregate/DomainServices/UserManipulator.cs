using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.Entities;
using MySocailApp.Domain.UserAggregate.ValueObjects;
using MySocailApp.Domain.UserAggregate.Exceptions;
using SolTake.Core;

namespace MySocailApp.Domain.UserAggregate.DomainServices
{
    public class UserManipulator(AccessTokenSetterDomainService accessTokenSetterDomainService, IUserReadRepository userReadRepository)
    {
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
        private readonly IUserReadRepository _userReadRepository = userReadRepository;

        public async Task UpdateImageAsync(User user, Multimedia media, CancellationToken cancellationToken)
        {
            user.UpdateImage(media);
            await _accessTokenSetterDomainService.SetAsync(user, cancellationToken);
        }

        public async Task RemoveImageAsync(User user, CancellationToken cancellationToken)
        {
            user.RemoveImage();
            await _accessTokenSetterDomainService.SetAsync(user, cancellationToken);
        }

        public async Task UpdateNameAsync(User user, string name, CancellationToken cancellationToken)
        {
            user.UpdateName(name);
            await _accessTokenSetterDomainService.SetAsync(user, cancellationToken);
        }

        public async Task UpdateUserNameAsync(User user, UserName userName, CancellationToken cancellationToken)
        {
            if (await _userReadRepository.UserNameExist(userName, cancellationToken))
                throw new UserNameAlreadyExistException();
            user.UpdateUserName(userName);
            await _accessTokenSetterDomainService.SetAsync(user, cancellationToken);
        }
    }
}
