using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Api.Filters
{
    public class UserFilterAttribute(IAccessTokenReader accessTokenReader, IUserWriteRepository userWriteRepository, IUserAccessor userAccessor) : ActionFilterAttribute
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async override Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            _userAccessor.User = 
                await _userWriteRepository.GetByIdAsync(accountId,CancellationToken.None) ??
                throw new UserNotFoundException();

            await next();
        }
    }
}
