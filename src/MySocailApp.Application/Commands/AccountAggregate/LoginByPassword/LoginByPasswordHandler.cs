using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Services;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByPassword
{
    public class LoginByPasswordHandler(UserManager<Account> userManager, ITokenService tokenService, IAppUserRepository userRepository, IMapper mapper) : IRequestHandler<LoginByPasswordDto, LoginResponseDto>
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenService _tokenService = tokenService;
        private readonly IAppUserRepository _userRepository = userRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<LoginResponseDto> Handle(LoginByPasswordDto request, CancellationToken cancellationToken)
        {
            Account account;
            if (Email.IsValid(request.EmailOrUserName))
                account =
                    await _userManager.FindByEmailAsync(request.EmailOrUserName) ??
                    throw new LoginFailedException();
            else
                account =
                    await _userManager.FindByNameAsync(request.EmailOrUserName) ??
                    throw new LoginFailedException();

            if (!await _userManager.CheckPasswordAsync(account, request.Password))
                throw new LoginFailedException();

            if (account.IsRemoved)
            {
                account.Restore();
                var user = (await _userRepository.GetWithAllAsync(account.Id, cancellationToken))!;
                user.Restore();
            }

            var result = await _userManager.UpdateSecurityStampAsync(account);
            if(!result.Succeeded)
                throw new ServerSideException(result.Errors.Select(x => x.Description).ToList());

            var token = await _tokenService.CreateTokenAsync(account);
            return _mapper.Map<Account, LoginResponseDto>(
                account,
                opt => opt.AfterMap((src, dest) => dest.Token = token)
            );
        }
    }
}
