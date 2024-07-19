using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.LogOut
{
    public class LogOutHandler(AccountManager accountManager, IAccessTokenReader tokenReader, UserManager<Account> userManager) : IRequestHandler<LogOutDto>
    {
        private readonly AccountManager _accountManager = accountManager;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly UserManager<Account> _userManager = userManager;

        public async Task Handle(LogOutDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account = (await _userManager.FindByIdAsync(accountId.ToString()))!;
            await _accountManager.LogOutAsync(account);
        }
    }
}
