using AutoMapper;
using MediatR;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.CreateAccount
{
    public class CreateAccountHandler(IMapper mapper, AccountManager accountManager) : IRequestHandler<CreateAccountDto, AccountDto>
    {
        private readonly IMapper _mapper = mapper;
        private readonly AccountManager _accountManager = accountManager;

        public async Task<AccountDto> Handle(CreateAccountDto request, CancellationToken cancellationToken)
        {
            var account = new Account();
            await _accountManager.CreateAsync(account,request.Email,request.Password,cancellationToken);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
