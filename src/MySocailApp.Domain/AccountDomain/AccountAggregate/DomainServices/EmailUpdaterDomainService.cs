using MySocailApp.Domain.AccountDomain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions;
using MySocailApp.Domain.AccountDomain.AccountAggregate.ValueObjects;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.DomainServices
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
