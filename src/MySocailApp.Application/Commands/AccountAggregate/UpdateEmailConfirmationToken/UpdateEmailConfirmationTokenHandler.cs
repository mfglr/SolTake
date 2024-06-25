using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmailConfirmationToken
{
    public class UpdateEmailConfirmationTokenHandler(IAccountAccessor accountAccessor, UserManager<Account> userManager) : IRequestHandler<UpdateEmailConfirmationTokenDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly UserManager<Account> _userManager = userManager;

        public async Task Handle(UpdateEmailConfirmationTokenDto request, CancellationToken cancellationToken)
        {
            _accountAccessor.Account.UpdateEmailConfirmationToken();
            await _userManager.UpdateAsync(_accountAccessor.Account);
        }
    }
}
