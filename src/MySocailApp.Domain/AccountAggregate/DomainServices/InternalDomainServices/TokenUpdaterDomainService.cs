using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices
{
    internal static class TokenUpdaterDomainService
    {
        public static async Task UpdateAsync(Account account, UserManager<Account> userManager, ITokenProviderOptions tokenProviderOptions)
        {
            var roles = await userManager.GetRolesAsync(account);
            account.AccessToken = AccessTokenGeneratorDomainService.Generate(account.Id, roles, tokenProviderOptions);
            account.RefreshToken = RefreshTokenGeneratorDomainService.Generate(account.Id, account.SecurityStamp!, tokenProviderOptions);
        }
    }
}
