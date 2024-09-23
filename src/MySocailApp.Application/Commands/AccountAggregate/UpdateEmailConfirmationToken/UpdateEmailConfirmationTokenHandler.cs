using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmailConfirmationToken
{
    public class UpdateEmailConfirmationTokenHandler(IAccessTokenReader tokenReader, UserManager<Account> userManager) : IRequestHandler<UpdateEmailConfirmationTokenDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly UserManager<Account> _userManager = userManager;

        public async Task Handle(UpdateEmailConfirmationTokenDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account =
                await _userManager.Users.FirstOrDefaultAsync(x => x.Id == accountId && !x.IsRemoved, cancellationToken) ??
                throw new AccountNotFoundException();

            account.UpdateEmailConfirmationToken();
            await _userManager.UpdateAsync(account);
        }
    }
}
