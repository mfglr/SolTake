using AutoMapper;
using MediatR;
using MySocailApp.Application.Commands.UserDomain.UserAggregate;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;
using MySocailApp.Domain.UserDomain.UserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.LoginByPassword
{
    public class LoginByPasswordHandler(AuthenticatorDomainService authenticatorDomainService, IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, AccessTokenSetterDomainService accessTokenSetterDomainService, RefreshTokenSetterDomainService refreshTokenSetterDomainService) : IRequestHandler<LoginByPasswordDto, LoginDto>
    {
        private readonly AuthenticatorDomainService _authenticatorDomainService = authenticatorDomainService;
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
        private readonly RefreshTokenSetterDomainService _refreshTokenSetterDomainService = refreshTokenSetterDomainService;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;


        public async Task<LoginDto> Handle(LoginByPasswordDto request, CancellationToken cancellationToken)
        {
            var password = new Password(request.Password);
            User user;
            try
            {
                var email = new Email(request.EmailOrUserName);
                user =
                    await _userWriteRepository.GetByEmailAsync(email, cancellationToken) ??
                    throw new LoginFailedException();
            }
            catch (InvalidEmailException)
            {
                var userName = new UserName(request.EmailOrUserName);
                user =
                    await _userWriteRepository.GetByUserNameAsync(userName, cancellationToken) ??
                    throw new LoginFailedException();
            }

            if (!user.CheckPassword(password))
                throw new LoginFailedException();

            await _authenticatorDomainService.LoginAsync(user, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            await _accessTokenSetterDomainService.SetAsync(user, cancellationToken);
            _refreshTokenSetterDomainService.Set(user);

            return new(user);
        }
    }
}
