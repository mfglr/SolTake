using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.DomainServices;
using MySocailApp.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.LoginByRefreshToken
{
    public class LoginByRefreshTokenHandler(IUserWriteRepository userWriteRepository, AuthenticatorDomainService authenticatorDomainService, RefreshTokenValidatorDomainService refreshTokenValidatorDomainService, AccessTokenSetterDomainService accessTokenSetterDomainService, RefreshTokenSetterDomainService refreshTokenSetterDomainService, IUnitOfWork unitOfWork) : IRequestHandler<LoginByRefreshTokenDto, LoginDto>
    {
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly AuthenticatorDomainService _authenticatorDomainService = authenticatorDomainService;
        private readonly RefreshTokenValidatorDomainService _refreshTokenValidatorDomainService = refreshTokenValidatorDomainService;
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
        private readonly RefreshTokenSetterDomainService _refreshTokenSetterDomainService = refreshTokenSetterDomainService;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<LoginDto> Handle(LoginByRefreshTokenDto request, CancellationToken cancellationToken)
        {
            var user =
                await _userWriteRepository.GetByIdAsync(request.Id, cancellationToken) ??
                throw new UserNotFoundException();

            await _refreshTokenValidatorDomainService.ValidateAsync(user, request.Token);
            await _authenticatorDomainService.LoginAsync(user, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            await _accessTokenSetterDomainService.SetAsync(user, cancellationToken);
            _refreshTokenSetterDomainService.Set(user);

            return new(user);
        }
    }
}
