using MySocailApp.Domain.UserDomain.PrivacyPolicyAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.TermsOfUseAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Domain.UserDomain.UserAggregate.DomainServices
{
    public class UserCreatorDomainService(IPrivacyPolicyReadRepository policyReadRepository, ITermsOfUseReadRepository termsOfUserReadRepository, IUserReadRepository accountReadRepository)
    {
        private readonly IPrivacyPolicyReadRepository _policyReadRepository = policyReadRepository;
        private readonly ITermsOfUseReadRepository _termsOfUserReadRepository = termsOfUserReadRepository;
        private readonly IUserReadRepository _accountReadRepository = accountReadRepository;

        public async Task CreateAsync(User user, CancellationToken cancellationToken)
        {
            if (user.Email != null && await _accountReadRepository.EmailExist(user.Email, cancellationToken))
                throw new EmailIsAlreadyTakenException();

            var policy = await _policyReadRepository.GetLastPolicyAsync(cancellationToken);
            var termsOfUse = await _termsOfUserReadRepository.GetLastTermsOfUseAsync(cancellationToken);
            user.Create(policy.Id, termsOfUse.Id);
        }
    }
}
