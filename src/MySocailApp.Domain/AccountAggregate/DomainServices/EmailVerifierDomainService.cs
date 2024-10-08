using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class EmailVerifierDomainService(UserManager<Account> userManager)
    {
        private readonly UserManager<Account> _userManager = userManager;

        public async Task VerifyAsync(Account account,string token)
        {
            try
            {
                account.VerifyEmailByToken(token);
            }
            catch (InvalidVerificationTokenException)
            {
                await _userManager.UpdateAsync(account);
                throw;
            }
            await _userManager.UpdateAsync(account);
        }
    }
}
