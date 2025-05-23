using Microsoft.AspNetCore.SignalR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Api.HubFilters
{
    public class EmailVerficationHubFilter(IUserAccessor userAccessor) : IHubFilter
    {
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async ValueTask<object?> InvokeMethodAsync(HubInvocationContext context, Func<HubInvocationContext, ValueTask<object?>> next)
        {
            if (!_userAccessor.User.IsEmailVerified)
                throw new EmailIsNotConfirmedException();
            return await next(context);
        }
    }
}
