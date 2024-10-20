using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateLanguage
{
    public class UpdateLanguageHandler(UserManager<Account> userManager, IAccessTokenReader accessTokenReader) : IRequestHandler<UpdateLanguageDto>
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(UpdateLanguageDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var account =
                await _userManager.Users.FirstOrDefaultAsync(x => x.Id == accountId, cancellationToken) ??
                throw new AccountNotFoundException();
            account.UpdateLanguage(request.Language);
            await _userManager.UpdateAsync(account);
        }
    }
}
