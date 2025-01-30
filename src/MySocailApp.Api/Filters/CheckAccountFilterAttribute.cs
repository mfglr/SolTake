using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.Exceptions;
using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Api.Filters
{
    public class CheckAccountFilterAttribute(IAccessTokenReader accessTokenReader, IAccountWriteRepository accountWriteRepository, IAccountAccessor accountAccessor) : ActionFilterAttribute
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;

        public async override Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            _accountAccessor.Account = 
                await _accountWriteRepository.GetAccountAsync(accountId,CancellationToken.None) ??
                throw new AccountNotFoundException();

            await next();
        }
    }
}
