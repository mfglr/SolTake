using AccountDomain.AccountAggregate.Exceptions;
using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Api.Filters
{
    public class CheckEmailVerificationFilterAttribute(IAccountAccessor accountAccessor) : ActionFilterAttribute
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;

        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            if (!_accountAccessor.Account.IsEmailVerified)
                throw new EmailIsNotConfirmedException();
            await next();
        }
    }
}
