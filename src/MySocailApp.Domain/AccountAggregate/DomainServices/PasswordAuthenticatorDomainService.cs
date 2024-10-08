using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using MySocailApp.Domain.PrivacyPolicyAggregate.Interfaces;
using MySocailApp.Domain.TermsOfUseAggregate.Abstracts;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class PasswordAuthenticatorDomainService(IPrivacyPolicyReadRepository policyReadRepository, UserManager<Account> userManager, ITokenProviderOptions tokenProviderOptions, ITermsOfUseReadRepository termsOfUseReadRepository)
    {
        private readonly IPrivacyPolicyReadRepository _policyReadRepository = policyReadRepository;
        private readonly ITermsOfUseReadRepository _termsOfUseReadRepository = termsOfUseReadRepository;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;

        public async Task LoginAsync(Account account, string password, CancellationToken cancellationToken)
        {
            if (password == null)
                throw new PasswordIsRequiredException();
            if (!await _userManager.CheckPasswordAsync(account, password))
                throw new LoginFailedException();

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
