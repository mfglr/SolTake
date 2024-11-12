using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Api.Filters
{
    public class CheckAccountFilterAttribute(IAccessTokenReader accessTokenReader, IAccountWriteRepository accountWriteRepository, IAccountAccessor accountAccessor) : ActionFilterAttribute
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;

        public async override Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            _accountAccessor.Account = 
                await _accountWriteRepository.GetAccountAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    CancellationToken.None
                ) ??
                throw new AccountNotFoundException();

            await next();
        }
    }
}
