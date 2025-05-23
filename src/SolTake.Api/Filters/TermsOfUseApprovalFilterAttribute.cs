using Microsoft.AspNetCore.Mvc.Filters;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Api.Filters
{
    public class TermsOfUseApprovalFilterAttribute(IUserAccessor userAccessor) : ActionFilterAttribute
    {
        private readonly IUserAccessor _userAccessor = userAccessor;

        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            if (!_userAccessor.User.IsTersmOfUseApproved)
                throw new PolicyNotApprovedException();
            await next();
        }
    }
}
