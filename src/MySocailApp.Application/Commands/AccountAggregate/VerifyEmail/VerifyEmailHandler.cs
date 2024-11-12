using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Application.Commands.AccountAggregate.VerifyEmail
{
    public class VerifyEmailHandler(UserManager<Account> userManager, IAccountAccessor accountAccessor) : IRequestHandler<VerifyEmailDto>
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;

        public async Task Handle(VerifyEmailDto request, CancellationToken cancellationToken)
        {
            var account = _accountAccessor.Account;
            await _userManager.ConfirmEmailByEncodedTokenAsync(account, request.Token);
        }
    }
}
