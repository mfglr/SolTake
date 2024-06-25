using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Api.Filters
{
    public class SetAccountFilterAttribute(IAccessTokenReader accessTokenReader, UserManager<Account> userManager, IAccountAccessor accountAccessor) : ActionFilterAttribute
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;

        public async override Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            _accountAccessor.Account = await _userManager.FindByIdAsync(accountId) ?? throw new AccountWasNotFoundException();
            if(_accountAccessor.Account.IsRemoved)
                throw new AccountDeactivatedException();

            await next();
        }
    }
}
