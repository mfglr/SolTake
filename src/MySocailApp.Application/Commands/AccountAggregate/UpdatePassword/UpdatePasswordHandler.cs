using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdatePassword
{
    public class UpdatePasswordHandler(IAccessTokenReader tokenReader, IMapper mapper, AccountManager accountManager, UserManager<Account> userManager) : IRequestHandler<UpdatePasswordDto, AccountDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMapper _mapper = mapper;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly AccountManager _accountManager = accountManager;

        public async Task<AccountDto> Handle(UpdatePasswordDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account =
                await _userManager.Users.FirstOrDefaultAsync(x => x.Id == accountId && !x.IsRemoved, cancellationToken) ??
                throw new AccountNotFoundException();

            await _accountManager.UpdatePasswordAsync(account, request.CurrentPassword, request.NewPassword,request.NewPasswordConfirmation);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
