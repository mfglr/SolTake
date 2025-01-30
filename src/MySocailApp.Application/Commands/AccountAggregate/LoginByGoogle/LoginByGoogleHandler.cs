using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.DomainServices;
using AccountDomain.AccountAggregate.Entities;
using AccountDomain.AccountAggregate.ValueObjects;
using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Extentions;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByGoogle
{
    public class LoginByGoogleHandler(GoogleTokenValidatorDomainService googleTokenReader, IMapper mapper, IHttpContextAccessor httpContextAccessor, IAccountWriteRepository accountWriteRepository, AccountCreatorDomainService accountCreatorDomainService, AuthenticatorDomainService authenticatorDomainService, AccessTokenSetterDomainService accessTokenSetterDomainService, RefreshTokenSetterDomainService refreshTokenSetterDomainService, IUnitOfWork unitOfWork) : IRequestHandler<LoginByGoogleDto, AccountDto>
    {
        private readonly GoogleTokenValidatorDomainService _googleTokenReader = googleTokenReader;
        private readonly AccountCreatorDomainService _accountCreatorDomainService = accountCreatorDomainService;
        private readonly AuthenticatorDomainService _authenticatorDomainService = authenticatorDomainService;
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
        private readonly RefreshTokenSetterDomainService _refreshTokenSetterDomainService = refreshTokenSetterDomainService;
        private readonly IMapper _mapper = mapper;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IHttpContextAccessor _httpContextAccessor = httpContextAccessor;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;

        public async Task<AccountDto> Handle(LoginByGoogleDto request, CancellationToken cancellationToken)
        {
            var googleAccount = await _googleTokenReader.ValidateAsync(request.AccessToken, cancellationToken);
            var account = await _accountWriteRepository.GetAccountByGoogleAccount(googleAccount, cancellationToken);

            if (account != null)
                await _authenticatorDomainService.LoginAsync(account, cancellationToken);
            else
            {
                var language = new Language(_httpContextAccessor.HttpContext.GetLanguage());
                account = new Account(googleAccount, language);
                await _accountCreatorDomainService.CreateAsync(account, cancellationToken);
                await _accountWriteRepository.CreateAsync(account, cancellationToken);
            }

            await _unitOfWork.CommitAsync(cancellationToken);

            await _accessTokenSetterDomainService.SetAsync(account, cancellationToken);
            _refreshTokenSetterDomainService.Set(account);

            return _mapper.Map<AccountDto>(account);
        }
    }
}
