using Microsoft.AspNetCore.Identity;
using MySocailApp.Core.Exceptions;
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
            var lastAccountPrivacyPolicy = account.PrivacyPolicies.OrderByDescending(x => x.PolicyId).First();
            if (lastPrivacyPolicy.Id != lastAccountPrivacyPolicy.PolicyId)
                account.AddPolicy(lastPrivacyPolicy.Id);

            //update TermsOfUse
            var lastTermsOfUse = await termsOfUserReadRepository.GetLastTermsOfUseAsync(cancellationToken);
            var lastAccountTermsOfUse = account.TermsOfUses.OrderByDescending(x => x.TermsOfUseId).First();
            if(lastTermsOfUse.Id != lastAccountTermsOfUse.TermsOfUseId)
                account.AddTermOfUse(lastTermsOfUse.Id);

            //update security stamp to revoke previous refresh token.
            var result = await userManager.UpdateSecurityStampAsync(account);
            if (!result.Succeeded) throw new ServerSideException();

            await TokenUpdaterDomainService.UpdateAsync(account, userManager, tokenProviderOptions);
        }
    }
}
