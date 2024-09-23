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
    public class UpdateUserNamehandler(IMapper mapper, IAccessTokenReader tokenReader, AccountManager accountManager, UserManager<Account> userManager) : IRequestHandler<UpdateUserNameDto, AccountDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMapper _mapper = mapper;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly AccountManager _accountManager = accountManager;

        public async Task<AccountDto> Handle(UpdateUserNameDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account =
                await _userManager.Users.FirstOrDefaultAsync(x => x.Id == accountId && !x.IsRemoved, cancellationToken) ??
                throw new AccountNotFoundException();
            await _accountManager.UpdateUserNameAsync(account, request.UserName);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
