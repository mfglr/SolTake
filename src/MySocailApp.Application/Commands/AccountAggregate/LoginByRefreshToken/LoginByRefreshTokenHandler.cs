using AutoMapper;
using MediatR;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByRefreshToken
{
    public class LoginByRefreshTokenHandler(IMapper mapper, RefreshTokenAuthenticatorDomainService loginByRefreshToken, IAccountWriteRepository accountWriteRepository) : IRequestHandler<LoginByRefreshTokenDto, AccountDto>
    {
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly RefreshTokenAuthenticatorDomainService _refreshTokenAuthenticator = loginByRefreshToken;
        private readonly IMapper _mapper = mapper;

        public async Task<AccountDto> Handle(LoginByRefreshTokenDto request, CancellationToken cancellationToken)
        {
            var account =
                await _accountWriteRepository.GetAccountAsync(request.Id, cancellationToken) ??
                throw new AccountNotFoundException();

            await _refreshTokenAuthenticator.LoginAsync(account, request.Token, cancellationToken);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
