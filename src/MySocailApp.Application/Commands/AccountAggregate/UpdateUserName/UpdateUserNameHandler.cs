using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Services;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AppUserAggregate;
using System.Net;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateUserName
{
    public class UpdateUserNamehandler(UserManager<Account> userManager, ITokenService tokenService, IAppUserRepository userRepository, IMapper mapper, IAccountAccessor accountAccessor) : IRequestHandler<UpdateUserNameDto, LoginResponseDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IAppUserRepository _userRepository = userRepository;
        private readonly ITokenService _tokenService = tokenService;
        private readonly IMapper _mapper = mapper;

        public async Task<LoginResponseDto> Handle(UpdateUserNameDto request, CancellationToken cancellationToken)
        {
            var account = _accountAccessor.Account;
            account.UpdateUserName(request.UserName);
            var user = (await _userRepository.GetByIdAsync(account.Id, cancellationToken))!;
            user.UpdateUserName(request.UserName);

            var result = await _userManager.UpdateAsync(account);
            if (!result.Succeeded)
                throw new ClientSideException(result.Errors.Select(x => x.Description).ToList(), (int)HttpStatusCode.BadRequest);

            var token = await _tokenService.CreateTokenAsync(account);
            return _mapper.Map<Account, LoginResponseDto>(
                account,
                opt => opt.AfterMap((src, dest) => dest.Token = token)
            );
        }
    }
}
