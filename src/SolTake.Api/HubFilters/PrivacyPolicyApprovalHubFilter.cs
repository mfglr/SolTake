﻿using Microsoft.AspNetCore.SignalR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Exceptions;

namespace SolTake.Api.HubFilters
{
    public class PrivacyPolicyApprovalHubFilter(IUserAccessor userAccessor) : IHubFilter
    {
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async ValueTask<object?> InvokeMethodAsync(HubInvocationContext context, Func<HubInvocationContext, ValueTask<object?>> next)
        {
            if (!_userAccessor.User.IsPrivacyPolicyApproved)
                throw new PolicyNotApprovedException();
            return await next(context);
        }
    }
}
