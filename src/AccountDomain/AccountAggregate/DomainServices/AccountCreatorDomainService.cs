using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.Entities;
using AccountDomain.AccountAggregate.Exceptions;
using AccountDomain.PrivacyPolicyAggregate.Abstracts;
using AccountDomain.TermsOfUseAggregate.Abstracts;

namespace AccountDomain.AccountAggregate.DomainServices
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
