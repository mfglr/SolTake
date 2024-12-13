using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class PasswordResetterDomainService(UserManager<Account> userManager)
    {
        private readonly UserManager<Account> _userManager = userManager;

        public async Task ResetAsync(Account account, string token, string password, string passwordConfirm)
        {
            PasswordValidatorDomainService.Validate(password, passwordConfirm);
            await _userManager.ResetPasswordAsync(account, token, password);
        }
    }
}
