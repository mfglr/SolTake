using AutoMapper;
using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateUserName
{
    public class UpdateUserNamehandler(IMapper mapper, IAccountAccessor accountAccessor, AccountManager accountManager) : IRequestHandler<UpdateUserNameDto, AccountDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IMapper _mapper = mapper;
        private readonly AccountManager _accountManager = accountManager;

        public async Task<AccountDto> Handle(UpdateUserNameDto request, CancellationToken cancellationToken)
        {
            var account = _accountAccessor.Account;
            await _accountManager.UpdateUserNameAsync(account, request.UserName);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
