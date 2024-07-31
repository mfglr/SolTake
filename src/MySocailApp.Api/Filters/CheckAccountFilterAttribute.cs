using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Api.Filters
{
    public class CheckAccountFilterAttribute(IAccessTokenReader accessTokenReader, UserManager<Account> userManager) : ActionFilterAttribute
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly UserManager<Account> _userManager = userManager;

        public async override Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var account = 
                await _userManager.Users.FirstOrDefaultAsync(x => x.Id == accountId) ?? 
                throw new AccountWasNotFoundException();

            if(account.IsRemoved)
                throw new AccountDeactivatedException();

            await next();
        }
    }
}
