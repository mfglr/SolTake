using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.Entities;
using AccountDomain.AccountAggregate.Exceptions;
using AccountDomain.AccountAggregate.ValueObjects;

namespace AccountDomain.AccountAggregate.DomainServices
{
    public class EmailUpdaterDomainService(IAccountReadRepository accountReadRepository)
    {
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;

        public async Task UpdateAsync(Account account, string email, CancellationToken cancellationToken)
        {
            var emailValue = new Email(email);
            if (await _accountReadRepository.EmailExist(emailValue, cancellationToken))
                throw new EmailIsAlreadyTakenException();

            account.UpdateEmail(emailValue);
        }
    }
}
