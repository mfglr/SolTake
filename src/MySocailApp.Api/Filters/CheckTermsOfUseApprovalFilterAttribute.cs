using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Api.Filters
{
    public class CheckTermsOfUseApprovalFilterAttribute(IAccountAccessor accountAccessor) : ActionFilterAttribute
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;

        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            if (!_accountAccessor.Account.IsTersmOfUseApproved)
                throw new PolicyNotApprovedException();
            await next();
        }
    }
}
