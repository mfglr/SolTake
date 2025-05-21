using SolTake.Domain.PrivacyPolicyAggregate.Abstracts;
using SolTake.Domain.TermsOfUseAggregate.Abstracts;
using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserAggregate.Entities;
using SolTake.Domain.UserAggregate.Exceptions;

namespace SolTake.Domain.UserAggregate.DomainServices
{
    public class UserCreatorDomainService(IPrivacyPolicyReadRepository policyReadRepository, ITermsOfUseReadRepository termsOfUserReadRepository, IUserReadRepository userReadRepository)
    {
        private readonly IPrivacyPolicyReadRepository _policyReadRepository = policyReadRepository;
        private readonly ITermsOfUseReadRepository _termsOfUserReadRepository = termsOfUserReadRepository;
        private readonly IUserReadRepository _userReadRepository = userReadRepository;

        public async Task CreateAsync(User user, CancellationToken cancellationToken)
        {
            if (await _userReadRepository.IsEmailTaken(user.Email, cancellationToken))
                throw new EmailIsAlreadyTakenException();

            var policy = await _policyReadRepository.GetLastPolicyAsync(cancellationToken);
            var termsOfUse = await _termsOfUserReadRepository.GetLastTermsOfUseAsync(cancellationToken);
            user.Create(policy.Id, termsOfUse.Id);
        }
    }
}
