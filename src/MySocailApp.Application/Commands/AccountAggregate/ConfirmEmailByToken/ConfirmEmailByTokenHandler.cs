using AutoMapper;
using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.ConfirmEmailByToken
{
    public class ConfirmEmailByTokenHandler(IAccountAccessor accountAccessor, AccountManager accountManager, IMapper mapper) : IRequestHandler<ConfirmEmailByTokenDto,AccountDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly AccountManager _accountManager = accountManager;
        private readonly IMapper _mapper = mapper;

        public async Task<AccountDto> Handle(ConfirmEmailByTokenDto request, CancellationToken cancellationToken)
        {
            await _accountManager.ConfirmEmailByToken(_accountAccessor.Account, request.Token);
            return _mapper.Map<AccountDto>(_accountAccessor.Account);
        }
    }
}
