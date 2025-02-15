using MySocailApp.Domain.UserDomain.PrivacyPolicyAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.TermsOfUseAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Domain.UserDomain.UserAggregate.DomainServices
{
    public class AuthenticatorDomainService(IPrivacyPolicyReadRepository privacyPolicyReadRepository, ITermsOfUseReadRepository termsOfUseReadRepository)
    {
        private readonly IPrivacyPolicyReadRepository _privacyPolicyReadRepository = privacyPolicyReadRepository;
        private readonly ITermsOfUseReadRepository _termsOfUseReadRepository = termsOfUseReadRepository;

        public async Task LoginAsync(User user, CancellationToken cancellationToken)
        {
            var lastPrivacyPolicy = await _privacyPolicyReadRepository.GetLastPolicyAsync(cancellationToken);
            var lastTermsOfUse = await _termsOfUseReadRepository.GetLastTermsOfUseAsync(cancellationToken);
            user.Login(lastPrivacyPolicy.Id, lastTermsOfUse.Id);
        }
    }
}
