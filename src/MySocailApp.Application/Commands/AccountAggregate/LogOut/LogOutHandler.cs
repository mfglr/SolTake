using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.LogOut
{
    public class LogOutHandler(IAccessTokenReader tokenReader, UserManager<Account> userManager) : IRequestHandler<LogOutDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly UserManager<Account> _userManager = userManager;

        public async Task Handle(LogOutDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account = 
                await _userManager.Users.FirstOrDefaultAsync( x => x.Id == accountId, cancellationToken) ?? 
                throw new AccountNotFoundException();

            var result = await _userManager.UpdateSecurityStampAsync(account);
            if (!result.Succeeded) throw new ServerSideException();
        }
    }
}
