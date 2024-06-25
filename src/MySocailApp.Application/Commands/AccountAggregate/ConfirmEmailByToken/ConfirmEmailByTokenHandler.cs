using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.ConfirmEmailByToken
{
    public class ConfirmEmailByTokenHandler(IAccountAccessor accountAccessor, UserManager<Account> userManager) : IRequestHandler<ConfirmEmailByTokenDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly UserManager<Account> _userManager = userManager;

        public async Task Handle(ConfirmEmailByTokenDto request, CancellationToken cancellationToken)
        {
            try
            {
                _accountAccessor.Account.ConfirmEmailByToken(request.Token);
            }
            catch (Exception)
            {
                await _userManager.UpdateAsync(_accountAccessor.Account);
                throw;
            }
            await _userManager.UpdateAsync(_accountAccessor.Account);
        }
    }
}
