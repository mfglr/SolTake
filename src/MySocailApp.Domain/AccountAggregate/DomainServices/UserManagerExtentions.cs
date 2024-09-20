using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.WebUtilities;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using System.Text;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public static class UserManagerExtentions
    {
        public static async Task<string> GenerateEncodedEmailConfirmationTokenAsync(this UserManager<Account> userManager, Account account)
        {
            var token = await userManager.GenerateEmailConfirmationTokenAsync(account);
            return WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(token));
        }

        public static async Task ConfirmEmailByEncodedTokenAsync(this UserManager<Account> userManager, Account account, string token)
        {
            ArgumentNullException.ThrowIfNull(token);

            if (account.EmailConfirmed)
                throw new EmailWasAlreadyConfirmedException();

            var codeDecoded = Encoding.UTF8.GetString(WebEncoders.Base64UrlDecode(token));
            var result = await userManager.ConfirmEmailAsync(account, codeDecoded);
            if (!result.Succeeded)
                throw new ServerSideException();
        }
    }
}
