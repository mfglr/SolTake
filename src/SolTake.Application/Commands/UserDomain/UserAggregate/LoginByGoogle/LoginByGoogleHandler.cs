using MediatR;
using Microsoft.AspNetCore.Http;
using SolTake.Application.Extentions;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserAggregate.DomainServices;
using SolTake.Domain.UserAggregate.Entities;
using SolTake.Domain.UserAggregate.ValueObjects;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.LoginByGoogle
{
    public class LoginByGoogleHandler(GoogleTokenValidatorDomainService googleTokenReader, IHttpContextAccessor httpContextAccessor, IUserWriteRepository userWriteRepository, UserCreatorDomainService accountCreatorDomainService, AuthenticatorDomainService authenticatorDomainService, AccessTokenSetterDomainService accessTokenSetterDomainService, IUnitOfWork unitOfWork) : IRequestHandler<LoginByGoogleDto, LoginDto>
    {
        private readonly GoogleTokenValidatorDomainService _googleTokenReader = googleTokenReader;
        private readonly UserCreatorDomainService _accountCreatorDomainService = accountCreatorDomainService;
        private readonly AuthenticatorDomainService _authenticatorDomainService = authenticatorDomainService;
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
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

            return new(user);
        }
    }
}
