using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.LogOut
{
    public class LogOutHandler(AccountManager accountManager, IAccountAccessor accountAccessor) : IRequestHandler<LogOutDto>
    {
        private readonly AccountManager _accountManager = accountManager;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;

        public async Task Handle(LogOutDto request, CancellationToken cancellationToken)
            => await _accountManager.LogOutAsync(_accountAccessor.Account);
    }
}
