using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Services;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.DeleteAccount
{
    public class DeleteAccountHandler(UserManager<Account> userManager, IAppUserWriteRepository userRepository, IAccountAccessor accountAccessor) : IRequestHandler<DeleteAccountDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IAppUserWriteRepository _userRepository = userRepository;

        public async Task Handle(DeleteAccountDto request, CancellationToken cancellationToken)
        {
            var account = _accountAccessor.Account;
            await _userManager.DeleteAsync(account);
            var user = (await _userRepository.GetWithAllAsync(account.Id, cancellationToken))!;
            _userRepository.Delete(user);

            var result = await _userManager.DeleteAsync(account);
            if(!result.Succeeded)
                throw new ServerSideException(result.Errors.Select(x => x.Description).ToList());
        }
    }
}
