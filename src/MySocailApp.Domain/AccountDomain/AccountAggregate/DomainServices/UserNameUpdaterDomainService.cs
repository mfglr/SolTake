using MySocailApp.Domain.AccountDomain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions;
using MySocailApp.Domain.AccountDomain.AccountAggregate.ValueObjects;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.DomainServices
{
    public class UserNameUpdaterDomainService(IAccountReadRepository accountReadRepository)
    {
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;
        
        public async Task UpdateAsync(Account account, UserName userName, CancellationToken cancellationToken)
        {
            if (await _accountReadRepository.UserNameExist(userName,cancellationToken))
                throw new UserNameAlreadyExistException();

            account.UpdateUserName(userName);
        }
    }
}
