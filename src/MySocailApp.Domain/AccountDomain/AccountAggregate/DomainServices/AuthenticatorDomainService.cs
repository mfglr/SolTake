using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountDomain.PrivacyPolicyAggregate.Abstracts;
using MySocailApp.Domain.AccountDomain.TermsOfUseAggregate.Abstracts;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.DomainServices
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
