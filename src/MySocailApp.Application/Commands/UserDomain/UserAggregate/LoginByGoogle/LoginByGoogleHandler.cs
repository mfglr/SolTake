using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Commands.UserDomain.UserAggregate;
using MySocailApp.Application.Extentions;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.DomainServices;
using MySocailApp.Domain.UserAggregate.Entities;
using MySocailApp.Domain.UserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.LoginByGoogle
{
    public class LoginByGoogleHandler(GoogleTokenValidatorDomainService googleTokenReader, IHttpContextAccessor httpContextAccessor, IUserWriteRepository userWriteRepository, UserCreatorDomainService accountCreatorDomainService, AuthenticatorDomainService authenticatorDomainService, AccessTokenSetterDomainService accessTokenSetterDomainService, RefreshTokenSetterDomainService refreshTokenSetterDomainService, IUnitOfWork unitOfWork) : IRequestHandler<LoginByGoogleDto, LoginDto>
    {
        private readonly GoogleTokenValidatorDomainService _googleTokenReader = googleTokenReader;
        private readonly UserCreatorDomainService _accountCreatorDomainService = accountCreatorDomainService;
        private readonly AuthenticatorDomainService _authenticatorDomainService = authenticatorDomainService;
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
        private readonly RefreshTokenSetterDomainService _refreshTokenSetterDomainService = refreshTokenSetterDomainService;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IHttpContextAccessor _httpContextAccessor = httpContextAccessor;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;

        public async Task<LoginDto> Handle(LoginByGoogleDto request, CancellationToken cancellationToken)
        {
            var googleAccount = await _googleTokenReader.ValidateAsync(request.AccessToken, cancellationToken);
            var user = await _userWriteRepository.GetByGoogleAccount(googleAccount, cancellationToken);

            if (user != null)
                await _authenticatorDomainService.LoginAsync(user, cancellationToken);
            else
            {
                var language = new Language(_httpContextAccessor.HttpContext.GetLanguage());
                user = new User(googleAccount, language);
                await _accountCreatorDomainService.CreateAsync(user, cancellationToken);
                await _userWriteRepository.CreateAsync(user, cancellationToken);
            }

            await _unitOfWork.CommitAsync(cancellationToken);

            await _accessTokenSetterDomainService.SetAsync(user, cancellationToken);
            _refreshTokenSetterDomainService.Set(user);

            return new(user);
        }
    }
}
