using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.PrivacyPolicyAggregate.Interfaces;
using MySocailApp.Domain.TermsOfUseAggregate.Abstracts;

namespace MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices
{
    internal static class LoginDomainService
    {
        public static async Task LoginAsync(Account account, UserManager<Account> userManager, IPrivacyPolicyReadRepository policyReadRepository, ITermsOfUseReadRepository termsOfUserReadRepository, ITokenProviderOptions tokenProviderOptions, CancellationToken cancellationToken)
        {
            //update Policy
            var lastPrivacyPolicy = await policyReadRepository.GetLastPolicyAsync(cancellationToken);
            if (lastPrivacyPolicy.Id != account.PrivacyPolicy.PolicyId)
                account.AddPolicy(lastPrivacyPolicy.Id);

            //update TermsOfUse
            var lastTermsOfUse = await termsOfUserReadRepository.GetLastTermsOfUseAsync(cancellationToken);
            if(lastTermsOfUse.Id != account.TermsOfUse.TermsOfUseId)
                account.AddTermOfUse(lastTermsOfUse.Id);

            //update security stamp to revoke previous refresh token.
            await userManager.UpdateSecurityStampAsync(account);

            await TokenUpdaterDomainService.UpdateAsync(tokenProviderOptions, userManager, account);
        }
    }
}
