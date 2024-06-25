using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Api.Filters
{
    public class EmailConfirmedFilterAttribute(IAccountAccessor accountAccessor) : ActionFilterAttribute
    {

        private readonly IAccountAccessor _accountAccessor = accountAccessor;

        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            if (_accountAccessor.Account.EmailConfirmed)
                throw new EmailIsNotConfirmedException();
            await next();
        }
    }
}
