using Microsoft.AspNetCore.Identity;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class EmailUpdaterDomainService(UserManager<Account> userManager, ITokenProviderOptions tokenProviderOptions)
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;

        public async Task UpdateAsync(Account account, string email)
        {
            if (await _userManager.FindByEmailAsync(email) != null)
                throw new EmailIsAlreadyTakenException();

            //update email of account
            account.UpdateEmail(email);

            //update security stamp to revoke prev refresh token
            var result = await _userManager.UpdateSecurityStampAsync(account);
            if (!result.Succeeded) throw new ServerSideException();

            //update token
            await TokenUpdaterDomainService.UpdateAsync(_tokenProviderOptions, _userManager, account);
        }
    }
}
