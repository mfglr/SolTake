using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.Entities;
using AccountDomain.AccountAggregate.Exceptions;
using AccountDomain.AccountAggregate.ValueObjects;

namespace AccountDomain.AccountAggregate.DomainServices
{
    public class UserNameUpdaterDomainService(IAccountReadRepository accountReadRepository)
    {
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;

        public async Task UpdateAsync(Account account, UserName userName, CancellationToken cancellationToken)
        {
            if (await _accountReadRepository.UserNameExist(userName, cancellationToken))
                throw new UserNameAlreadyExistException();

            account.UpdateUserName(userName);
        }
    }
}
