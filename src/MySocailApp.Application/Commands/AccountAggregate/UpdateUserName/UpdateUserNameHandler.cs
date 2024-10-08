using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateUserName
{
    public class UpdateUserNamehandler(IAccessTokenReader tokenReader, UserNameUpdaterDomainService accountManager, UserManager<Account> userManager) : IRequestHandler<UpdateUserNameDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly UserNameUpdaterDomainService _accountManager = accountManager;

        public async Task Handle(UpdateUserNameDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account =
                await _userManager.Users.FirstOrDefaultAsync(x => x.Id == accountId && !x.IsRemoved, cancellationToken) ??
                throw new AccountNotFoundException();

            await _accountManager.UpdateAsync(account, request.UserName);
        }
    }
}
