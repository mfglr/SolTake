using AutoMapper;
using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.CreateAccount
{
    public class CreateAccountHandler(ITokenService tokenService,IMapper mapper, AccountCreator creator) : IRequestHandler<CreateAccountDto, AccountDto>
    {
        private readonly ITokenService _tokenService = tokenService;
        private readonly IMapper _mapper = mapper;
        private readonly AccountCreator _creator = creator;

        public async Task<AccountDto> Handle(CreateAccountDto request, CancellationToken cancellationToken)
        {
            var account = new Account();
            await _creator.CreateAsync(account,request.Email,request.Password,cancellationToken);

            var token = await _tokenService.CreateTokenAsync(account);
            return _mapper.Map<Account, AccountDto>(
                account,
                opt => opt.AfterMap((src, dest) => dest.Token = token)
            );

        }
    }
}
