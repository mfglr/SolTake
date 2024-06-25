using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Services;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate;
using System.Net;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmail
{
    public class UpdateEmailHandler(UserManager<Account> userManager, ITokenService tokenService, IMapper mapper, IAccountAccessor accountAccessor) : IRequestHandler<UpdateEmailDto, LoginResponseDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenService _tokenService = tokenService;
        private readonly IMapper _mapper = mapper;

        public async Task<LoginResponseDto> Handle(UpdateEmailDto request, CancellationToken cancellationToken)
        {
            var account = _accountAccessor.Account;
            account.UpdateEmail(request.Email);

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
