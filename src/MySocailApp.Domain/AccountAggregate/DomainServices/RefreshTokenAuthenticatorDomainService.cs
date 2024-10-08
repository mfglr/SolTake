using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using MySocailApp.Domain.PrivacyPolicyAggregate.Interfaces;
using MySocailApp.Domain.TermsOfUseAggregate.Abstracts;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class RefreshTokenAuthenticatorDomainService(IPrivacyPolicyReadRepository policyReadRepository, UserManager<Account> userManager, ITokenProviderOptions tokenProviderOptions, ITermsOfUseReadRepository termsOfUseReadRepository)
    {
        private readonly IPrivacyPolicyReadRepository _policyReadRepository = policyReadRepository;
        private readonly ITermsOfUseReadRepository _termsOfUseReadRepository = termsOfUseReadRepository;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;

        public async Task LoginAsync(Account account, string refrehToken, CancellationToken cancellationToken)
        {
            if (refrehToken == null)
                throw new RefreshTokenIsRequiredException();
            await RefreshTokenValidatorValidatorDomainService.ValidateAsync(account.Id, account.SecurityStamp!, refrehToken, _tokenProviderOptions);

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
