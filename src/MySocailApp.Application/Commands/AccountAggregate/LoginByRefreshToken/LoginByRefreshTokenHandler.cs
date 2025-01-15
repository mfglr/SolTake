using AccountDomain.Abstracts;
using AccountDomain.DomainServices;
using AccountDomain.Exceptions;
using AutoMapper;
using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByRefreshToken
{
    public class LoginByRefreshTokenHandler(IMapper mapper, IAccountWriteRepository accountWriteRepository, AuthenticatorDomainService authenticatorDomainService, RefreshTokenValidatorDomainService refreshTokenValidatorDomainService, AccessTokenSetterDomainService accessTokenSetterDomainService, RefreshTokenSetterDomainService refreshTokenSetterDomainService, IUnitOfWork unitOfWork) : IRequestHandler<LoginByRefreshTokenDto, AccountDto>
    {
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly IMapper _mapper = mapper;
        private readonly AuthenticatorDomainService _authenticatorDomainService = authenticatorDomainService;
        private readonly RefreshTokenValidatorDomainService _refreshTokenValidatorDomainService = refreshTokenValidatorDomainService;
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
        private readonly RefreshTokenSetterDomainService _refreshTokenSetterDomainService = refreshTokenSetterDomainService;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<AccountDto> Handle(LoginByRefreshTokenDto request, CancellationToken cancellationToken)
        {
            var account =
                await _accountWriteRepository.GetAccountAsync(request.Id, cancellationToken) ??
                throw new AccountNotFoundException();

            await _refreshTokenValidatorDomainService.ValidateAsync(account, request.Token);
            await _authenticatorDomainService.LoginAsync(account, cancellationToken);
            
            await _unitOfWork.CommitAsync(cancellationToken);

            await _accessTokenSetterDomainService.SetAsync(account, cancellationToken);
            _refreshTokenSetterDomainService.Set(account);

            return _mapper.Map<AccountDto>(account);
        }
    }
}
