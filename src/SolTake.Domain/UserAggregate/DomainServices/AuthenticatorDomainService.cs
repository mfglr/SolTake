using SolTake.Domain.PrivacyPolicyAggregate.Abstracts;
using SolTake.Domain.TermsOfUseAggregate.Abstracts;
using SolTake.Domain.UserAggregate.Entities;

namespace SolTake.Domain.UserAggregate.DomainServices
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
