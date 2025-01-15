using AccountDomain.Abstracts;
using AccountDomain.Exceptions;
using AccountDomain.ValueObjects;

namespace AccountDomain.DomainServices
{
    public class EmailUpdaterDomainService(IAccountReadRepository accountReadRepository)
    {
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;

        public async Task UpdateAsync(Entities.Account account, string email, CancellationToken cancellationToken)
        {
            var emailValue = new Email(email);
            if (await _accountReadRepository.EmailExist(emailValue, cancellationToken))
                throw new EmailIsAlreadyTakenException();

            account.UpdateEmail(emailValue);
        }
    }
}
