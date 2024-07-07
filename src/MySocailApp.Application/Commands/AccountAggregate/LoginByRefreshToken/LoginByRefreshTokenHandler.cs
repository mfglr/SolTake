using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Services;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByRefreshToken
{
    public class LoginByRefreshTokenHandler(UserManager<Account> userManager, ITokenService tokenService, IMapper mapper) : IRequestHandler<LoginByRefreshTokenDto, AccountDto>
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenService _tokenService = tokenService;
        private readonly IMapper _mapper = mapper;

        public async Task<AccountDto> Handle(LoginByRefreshTokenDto request, CancellationToken cancellationToken)
        {
            var account =
                await _userManager.Users.FirstAsync(x => x.Id == request.Id && !x.IsRemoved,cancellationToken) ??
                throw new AccountWasNotFoundException();
            if (!await _tokenService.VerifyRefreshToken(account, request.Token))
                throw new InvalidRefreshTokenException();
            
            var result = await _userManager.UpdateSecurityStampAsync(account);
            if (!result.Succeeded)
                throw new ServerSideException(result.Errors.Select(x => x.Description).ToList());
            
            var token = await _tokenService.CreateTokenAsync(account);
            return _mapper.Map<Account, AccountDto>(
                account,
                opt => opt.AfterMap((src, dest) => dest.Token = token)
            );
        }
    }
}
