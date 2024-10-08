using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.VerifyEmail
{
    public class VerifyEmailHandler(UserManager<Account> userManager) : IRequestHandler<VerifyEmailDto>
    {
        private readonly UserManager<Account> _userManager = userManager;

        public async Task Handle(VerifyEmailDto request, CancellationToken cancellationToken)
        {
            var account =
                await _userManager.Users.FirstOrDefaultAsync(x => x.Id == int.Parse(request.Id) && !x.IsRemoved, cancellationToken) ??
                throw new AccountNotFoundException();
            await _userManager.ConfirmEmailByEncodedTokenAsync(account, request.Token);
        }
    }
}
