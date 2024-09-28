using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.ConfirmEmailByToken
{
    public class ConfirmEmailByTokenHandler(IAccessTokenReader tokenReader, UserManager<Account> userManager) : IRequestHandler<ConfirmEmailByTokenDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly UserManager<Account> _userManager = userManager;

        public async Task Handle(ConfirmEmailByTokenDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account = 
                await _userManager.Users.FirstOrDefaultAsync(x => x.Id == accountId && !x.IsRemoved, cancellationToken) ?? 
                throw new AccountNotFoundException();
            try
            {
                account.ConfirmEmailByToken(request.Token);
            }
            catch (InvalidVerificationTokenException)
            {
                await _userManager.UpdateAsync(account);
                throw;
            }
            await _userManager.UpdateAsync(account);
        }
    }
}
