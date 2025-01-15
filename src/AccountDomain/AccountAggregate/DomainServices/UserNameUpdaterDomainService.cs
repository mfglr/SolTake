using AccountDomain.Abstracts;
using AccountDomain.Exceptions;
using AccountDomain.ValueObjects;

namespace AccountDomain.DomainServices
{
    public class UserNameUpdaterDomainService(IAccountReadRepository accountReadRepository)
    {
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;

        public async Task UpdateAsync(Entities.Account account, UserName userName, CancellationToken cancellationToken)
        {
            if (await _accountReadRepository.UserNameExist(userName, cancellationToken))
                throw new UserNameAlreadyExistException();

            account.UpdateUserName(userName);
        }
    }
}
