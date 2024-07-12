using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmailConfirmationToken
{
    public class UpdateEmailConfirmationTokenHandler(IAccountAccessor accountAccessor, UserManager<Account> userManager, IMapper mapper) : IRequestHandler<UpdateEmailConfirmationTokenDto, AccountDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IMapper _mapper = mapper;

        public async Task<AccountDto> Handle(UpdateEmailConfirmationTokenDto request, CancellationToken cancellationToken)
        {
            _accountAccessor.Account.UpdateEmailConfirmationToken();
            await _userManager.UpdateAsync(_accountAccessor.Account);
            return _mapper.Map<AccountDto>(_accountAccessor.Account);
        }
    }
}
