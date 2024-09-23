using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.DeleteAccount
{
    public class DeleteAccountHandler(UserManager<Account> userManager, IAccessTokenReader tokenReader, AccountRemoverDomainService accountRemover, IUnitOfWork unitOfWork) : IRequestHandler<DeleteAccountDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly AccountRemoverDomainService _accountRemover = accountRemover;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DeleteAccountDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account =
                await _userManager.Users.FirstOrDefaultAsync(x => x.Id == accountId && !x.IsRemoved, cancellationToken) ??
                throw new AccountNotFoundException();
            await _accountRemover.RemoveAsync(account, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
