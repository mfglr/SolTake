using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices
{
    internal static class TokenUpdaterDomainService
    {
        public static async Task UpdateAsync(ITokenProviderOptions tokenProviderOptions, UserManager<Account> userManager, Account account)
        {
            account.AccessToken = await AccessTokenGeneratorDomainService.GenerateAsync(tokenProviderOptions, userManager, account);
            account.RefreshToken = RefreshTokenGeneratorDomainService.Generate(tokenProviderOptions, account);
        }
    }
}
