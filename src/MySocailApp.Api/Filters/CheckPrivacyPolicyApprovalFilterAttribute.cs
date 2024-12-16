using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions;

namespace MySocailApp.Api.Filters
{
    public class CheckPrivacyPolicyApprovalFilterAttribute(IAccountAccessor accountAccessor) : ActionFilterAttribute
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;

        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            if (!_accountAccessor.Account.IsPrivacyPolicyApproved)
                throw new PolicyNotApprovedException();
            await next();
        }
    }
}
