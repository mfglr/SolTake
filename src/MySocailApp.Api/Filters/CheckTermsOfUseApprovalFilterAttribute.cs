using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Api.Filters
{
    public class CheckTermsOfUseApprovalFilterAttribute(IUserAccessor userAccessor) : ActionFilterAttribute
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
