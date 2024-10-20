using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Extentions;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmailVerificationToken
{
    public class UpdateEmailVerificationTokenHandler(IAccessTokenReader tokenReader, IAccountWriteRepository accountWriteRepository, UserManager<Account> userManager) : IRequestHandler<UpdateEmailVerificationTokenDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly UserManager<Account> _userManager = userManager;

        public async Task Handle(UpdateEmailVerificationTokenDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account =
                await _accountWriteRepository.GetAccountAsync(accountId, cancellationToken) ??
                throw new AccountNotFoundException();

            account.UpdateEmailVerificationToken();
            await _userManager.UpdateAsync(account);
        }
    }
}
