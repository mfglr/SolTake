using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByPassword
{
    public class LoginByPasswordHandler(UserManager<Account> userManager, IMapper mapper, AccountManager accountManager) : IRequestHandler<LoginByPasswordDto, AccountDto>
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IMapper _mapper = mapper;
        private readonly AccountManager _accountManager = accountManager;

        public async Task<AccountDto> Handle(LoginByPasswordDto request, CancellationToken cancellationToken)
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

            await _accountManager.LoginByPassword(account, request.Password, cancellationToken);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
