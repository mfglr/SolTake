using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using MySocailApp.Domain.PrivacyPolicyAggregate.Interfaces;
using MySocailApp.Domain.TermsOfUseAggregate.Abstracts;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class ThirdPartyAuthenticatorDomainService(IPrivacyPolicyReadRepository policyReadRepository, UserManager<Account> userManager, IAccountWriteRepository accountWriteRepository, ITokenProviderOptions tokenProviderOptions, ITermsOfUseReadRepository termsOfUseReadRepository)
    {
        private readonly IPrivacyPolicyReadRepository _policyReadRepository = policyReadRepository;
        private readonly ITermsOfUseReadRepository _termsOfUseReadRepository = termsOfUseReadRepository;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;

        public async Task LoginAsync(Account account, CancellationToken cancellationToken)
        {
            account =
                await _accountWriteRepository.GetAccountAsync(account.Id, cancellationToken) ??
                throw new AccountNotFoundException();

            await LoginDomainService
                .LoginAsync(
                    account,
                    _userManager,
                    _policyReadRepository,
                    _termsOfUseReadRepository,
                    _tokenProviderOptions,
                    cancellationToken
                );
        }
    }
}
