using AccountDomain.AccountAggregate.Entities;
using AccountDomain.PrivacyPolicyAggregate.Abstracts;
using AccountDomain.TermsOfUseAggregate.Abstracts;

namespace AccountDomain.AccountAggregate.DomainServices
{
    public class AuthenticatorDomainService(IPrivacyPolicyReadRepository privacyPolicyReadRepository, ITermsOfUseReadRepository termsOfUseReadRepository)
    {
        private readonly IPrivacyPolicyReadRepository _privacyPolicyReadRepository = privacyPolicyReadRepository;
        private readonly ITermsOfUseReadRepository _termsOfUseReadRepository = termsOfUseReadRepository;

        public async Task LoginAsync(Account account, CancellationToken cancellationToken)
        {
            var lastPrivacyPolicy = await _privacyPolicyReadRepository.GetLastPolicyAsync(cancellationToken);
            var lastTermsOfUse = await _termsOfUseReadRepository.GetLastTermsOfUseAsync(cancellationToken);
            account.Login(lastPrivacyPolicy.Id, lastTermsOfUse.Id);
        }
    }
}
