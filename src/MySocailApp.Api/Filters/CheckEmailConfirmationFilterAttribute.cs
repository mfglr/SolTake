using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Api.Filters
{
    public class CheckEmailConfirmationFilterAttribute(UserManager<Account> userManager, IAccessTokenReader accessTokenReader) : ActionFilterAttribute
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly UserManager<Account> _userManager = userManager;

        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var account = await _userManager.FindByIdAsync(accountId.ToString());
            if (!account!.EmailConfirmed)
                throw new EmailIsNotConfirmedException();
            await next();
        }
    }
}
