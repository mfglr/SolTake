using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Services;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdatePassword
{
    public class UpdatePasswordHandler(UserManager<Account> userManager, ITokenService tokenService,IAccountAccessor accountAccessor, IMapper mapper) : IRequestHandler<UpdatePasswordDto, LoginResponseDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenService _tokenService = tokenService;
        private readonly IMapper _mapper = mapper;

        public async Task<LoginResponseDto> Handle(UpdatePasswordDto request, CancellationToken cancellationToken)
        {
            var account = _accountAccessor.Account;
            if (!await _userManager.CheckPasswordAsync(account, request.CurrentPassword))
                throw new IncorrectPasswordException();
            
            var result = await _userManager.ChangePasswordAsync(account, request.CurrentPassword, request.NewPassword);
            if (!result.Succeeded)
                throw new ServerSideException(result.Errors.Select(x => x.Description).ToList());

            var token = await _tokenService.CreateTokenAsync(account);
            return _mapper.Map<Account, LoginResponseDto>(
                account,
                opt => opt.AfterMap((src, dest) => dest.Token = token)
            );
        }
    }
}
