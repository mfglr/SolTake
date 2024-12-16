using MySocailApp.Domain.AccountDomain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions;
using MySocailApp.Domain.AccountDomain.PrivacyPolicyAggregate.Abstracts;
using MySocailApp.Domain.AccountDomain.TermsOfUseAggregate.Abstracts;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.DomainServices
{
    public class AccountCreatorDomainService(IPrivacyPolicyReadRepository policyReadRepository, ITermsOfUseReadRepository termsOfUserReadRepository, IAccountReadRepository accountReadRepository)
    {
        private readonly IPrivacyPolicyReadRepository _policyReadRepository = policyReadRepository;
        private readonly ITermsOfUseReadRepository _termsOfUserReadRepository = termsOfUserReadRepository;
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;

        public async Task CreateAsync(Account account, CancellationToken cancellationToken)
        {
            if (account.Email != null && await _accountReadRepository.EmailExist(account.Email, cancellationToken))
                throw new EmailIsAlreadyTakenException();

            var policy = await _policyReadRepository.GetLastPolicyAsync(cancellationToken);
            var termsOfUse = await _termsOfUserReadRepository.GetLastTermsOfUseAsync(cancellationToken);
            account.Create(policy.Id, termsOfUse.Id);
        }
    }
}
