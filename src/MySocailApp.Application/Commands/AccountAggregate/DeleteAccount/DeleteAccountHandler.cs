using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Services;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.DeleteAccount
{
    public class DeleteAccountHandler(UserManager<Account> userManager, IAppUserWriteRepository userRepository, IAccessTokenReader tokenReader) : IRequestHandler<DeleteAccountDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IAppUserWriteRepository _userRepository = userRepository;

        public async Task Handle(DeleteAccountDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account = (await _userManager.FindByIdAsync(accountId.ToString()))!;
            var user = (await _userRepository.GetWithAllAsync(account.Id, cancellationToken))!;
            _userRepository.Delete(user);
            var result = await _userManager.DeleteAsync(account);
            if(!result.Succeeded)
                throw new ServerSideException(result.Errors.Select(x => x.Description).ToList());
        }
    }
}
