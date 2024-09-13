using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByRefreshToken
{
    public class LoginByRefreshTokenHandler(UserManager<Account> userManager,IMapper mapper, AccountManager accountManager) : IRequestHandler<LoginByRefreshTokenDto, AccountDto>
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly AccountManager _accountManager = accountManager;
        private readonly IMapper _mapper = mapper;

        public async Task<AccountDto> Handle(LoginByRefreshTokenDto request, CancellationToken cancellationToken)
        {
            var account =
                await _userManager.Users.FirstAsync(x => x.Id == request.Id, cancellationToken) ??
                throw new AccountNotFoundException();
            await _accountManager.LoginByRefreshToken(account, request.Token);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
