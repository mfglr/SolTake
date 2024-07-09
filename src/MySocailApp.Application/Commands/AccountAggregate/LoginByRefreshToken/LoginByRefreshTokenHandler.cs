using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByRefreshToken
{
    public class LoginByRefreshTokenHandler(UserManager<Account> userManager,IMapper mapper, LoginManager loginManager) : IRequestHandler<LoginByRefreshTokenDto, AccountDto>
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly LoginManager _loginManger = loginManager;
        private readonly IMapper _mapper = mapper;

        public async Task<AccountDto> Handle(LoginByRefreshTokenDto request, CancellationToken cancellationToken)
        {
            var account =
                await _userManager.Users.FirstAsync(x => x.Id == request.Id && !x.IsRemoved, cancellationToken) ??
                throw new AccountWasNotFoundException();

            await _loginManger.LoginByRefreshToken(account, request.Token);

            return _mapper.Map<AccountDto>(account);
        }
    }
}
