using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Api.HubFilters
{
    public class TermsOfUseApprovalHubFilter(IUserAccessor userAccessor) : IHubFilter
    {
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async ValueTask<object?> InvokeMethodAsync(HubInvocationContext context, Func<HubInvocationContext, ValueTask<object?>> next)
        {
            if (!_userAccessor.User.IsTersmOfUseApproved)
                throw new PolicyNotApprovedException();
            return await next(context);
        }
    }
}
