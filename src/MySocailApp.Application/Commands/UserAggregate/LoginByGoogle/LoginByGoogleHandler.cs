using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Extentions;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserAggregate.LoginByGoogle
{
    public class LoginByGoogleHandler(GoogleTokenValidatorDomainService googleTokenReader, IMapper mapper, IHttpContextAccessor httpContextAccessor, IUserWriteRepository userWriteRepository, UserCreatorDomainService accountCreatorDomainService, AuthenticatorDomainService authenticatorDomainService, AccessTokenSetterDomainService accessTokenSetterDomainService, RefreshTokenSetterDomainService refreshTokenSetterDomainService, IUnitOfWork unitOfWork) : IRequestHandler<LoginByGoogleDto, AccountDto>
    {
        private readonly GoogleTokenValidatorDomainService _googleTokenReader = googleTokenReader;
        private readonly UserCreatorDomainService _accountCreatorDomainService = accountCreatorDomainService;
        private readonly AuthenticatorDomainService _authenticatorDomainService = authenticatorDomainService;
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
        private readonly RefreshTokenSetterDomainService _refreshTokenSetterDomainService = refreshTokenSetterDomainService;
        private readonly IMapper _mapper = mapper;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IHttpContextAccessor _httpContextAccessor = httpContextAccessor;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;

        public async Task<AccountDto> Handle(LoginByGoogleDto request, CancellationToken cancellationToken)
        {
            var googleAccount = await _googleTokenReader.ValidateAsync(request.AccessToken, cancellationToken);
            var account = await _userWriteRepository.GetByGoogleAccount(googleAccount, cancellationToken);

            if (account != null)
                await _authenticatorDomainService.LoginAsync(account, cancellationToken);
            else
            {
                var language = new Language(_httpContextAccessor.HttpContext.GetLanguage());
                account = new User(googleAccount, language);
                await _accountCreatorDomainService.CreateAsync(account, cancellationToken);
                await _userWriteRepository.CreateAsync(account, cancellationToken);
            }

            await _unitOfWork.CommitAsync(cancellationToken);

            await _accessTokenSetterDomainService.SetAsync(account, cancellationToken);
            _refreshTokenSetterDomainService.Set(account);

            return _mapper.Map<AccountDto>(account);
        }
    }
}
