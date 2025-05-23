using Microsoft.AspNetCore.SignalR;
using SolTake.Application.Extentions;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Api.HubFilters
{
    public class UserHubFilter(IUserWriteRepository userWriteRepository, IUserAccessor userAccessor) : IHubFilter
    {
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async ValueTask<object?> InvokeMethodAsync(HubInvocationContext context, Func<HubInvocationContext, ValueTask<object?>> next)
        {
            var httpContext = context.Context.GetHttpContext();

            var userId = int.Parse(httpContext.GetRequiredUserId());
            _userAccessor.User =
                await _userWriteRepository.GetByIdAsync(userId, CancellationToken.None) ??
                throw new UserNotFoundException();
            
            return await next(context);
        }
    }
}
