﻿using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Api.Filters
{
    public class CheckEmailConfirmationFilterAttribute(IAccessTokenReader accessTokenReader, IAccountReadRepository accountReadRepository) : ActionFilterAttribute
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;

        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var account =
                await _accountReadRepository.GetAccountAsync(accountId,CancellationToken.None) ??
                throw new AccountNotFoundException();

            if (!account.IsThirdPartyAuthenticated && !account.VerificationTokens.OrderByDescending(x => x.Id).First().IsVerified)
                throw new EmailIsNotConfirmedException();

            await next();
        }
    }
}
