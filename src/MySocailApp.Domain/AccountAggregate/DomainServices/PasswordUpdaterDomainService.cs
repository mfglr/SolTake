using Microsoft.AspNetCore.Identity;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class PasswordUpdaterDomainService(UserManager<Account> userManager, ITokenProviderOptions tokenProviderOptions)
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;

        public async Task UpdateAsync(Account account, string currentPasword, string newPassword, string newPasswordConfirm)
        {
            PasswordValidatorDomainService.Validate(newPassword, newPasswordConfirm);
            if (!await _userManager.CheckPasswordAsync(account, currentPasword))
                throw new IncorrectPasswordException();

            //update password;
            var result = await _userManager.ChangePasswordAsync(account, currentPasword, newPassword);
            if (!result.Succeeded) throw new ServerSideException();

            //update token
            await TokenUpdaterDomainService.UpdateAsync(account, _userManager, _tokenProviderOptions);
        }
    }
}
