using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

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
            var account = 
                await _userManager.Users.FirstOrDefaultAsync( x => x.Id == accountId && !x.IsRemoved, cancellationToken) ?? 
                throw new AccountNotFoundException();

            await _accountManager.LogOutAsync(account);
        }
    }
}
