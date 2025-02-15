using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;
using MySocailApp.Domain.UserDomain.UserAggregate.ValueObjects;

namespace MySocailApp.Domain.UserDomain.UserAggregate.DomainServices
{
    public class UserNameUpdaterDomainService(IUserReadRepository userReadRepository)
    {
        private readonly IUserReadRepository _userReadRepository = userReadRepository;

        public async Task UpdateAsync(User user, UserName userName, CancellationToken cancellationToken)
        {
            if (await _userReadRepository.UserNameExist(userName, cancellationToken))
                throw new UserNameAlreadyExistException();

            user.UpdateUserName(userName);
        }
    }
}
