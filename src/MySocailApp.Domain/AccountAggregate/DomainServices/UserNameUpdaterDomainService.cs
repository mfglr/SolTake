using Microsoft.AspNetCore.Identity;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class UserNameUpdaterDomainService(UserManager<Account> userManager)
    {
        private readonly UserManager<Account> _userManager = userManager;

        public async Task UpdateAsync(Account account, string userName)
        {
            UserNameValidatorDomainService.Validate(userName);
            if ((await _userManager.FindByNameAsync(userName)) != null)
                throw new EmailIsAlreadyTakenException();

            account.UpdateUserName(userName);
            var result = await _userManager.UpdateAsync(account);
            if (!result.Succeeded) throw new ServerSideException();
        }
    }
}
