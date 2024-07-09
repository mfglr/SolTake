using AutoMapper;
using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdatePassword
{
    public class UpdatePasswordHandler(IAccountAccessor accountAccessor, IMapper mapper, AccountManager accountManager) : IRequestHandler<UpdatePasswordDto, AccountDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IMapper _mapper = mapper;
        private readonly AccountManager _accountManager = accountManager;

        public async Task<AccountDto> Handle(UpdatePasswordDto request, CancellationToken cancellationToken)
        {
            var account = _accountAccessor.Account;
            await _accountManager.UpdatePasswordAsync(account,request.CurrentPassword,request.NewPassword);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
