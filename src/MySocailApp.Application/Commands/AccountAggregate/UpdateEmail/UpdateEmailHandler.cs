using AutoMapper;
using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmail
{
    public class UpdateEmailHandler(IMapper mapper, IAccountAccessor accountAccessor, AccountManager accountManager) : IRequestHandler<UpdateEmailDto, AccountDto>
    {
        private readonly AccountManager _accountManager = accountManager;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IMapper _mapper = mapper;

        public async Task<AccountDto> Handle(UpdateEmailDto request, CancellationToken cancellationToken)
        {
            var account = _accountAccessor.Account;
            await _accountManager.UpdateEmailAsync(account, request.Email);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
