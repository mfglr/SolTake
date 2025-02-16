using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Extentions;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserAggregate.CreateUser
{
    public class CreateUserHandler(UserCreatorDomainService userCreatorDomainService, IHttpContextAccessor contextAccessor, IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, AccessTokenSetterDomainService accessTokenSetterDomainService, RefreshTokenSetterDomainService refreshTokenSetterDomainService) : IRequestHandler<CreateUserDto, LoginDto>
    {
        private readonly UserCreatorDomainService _userCreatorDomainService = userCreatorDomainService;
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
        private readonly RefreshTokenSetterDomainService _refreshTokenSetterDomainService = refreshTokenSetterDomainService;
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<LoginDto> Handle(CreateUserDto request, CancellationToken cancellationToken)
        {
            var email = new Email(request.Email);
            var password = new Password(request.Password);
            var passwordConfirm = new Password(request.PasswordConfirm);
            var language = new Language(_contextAccessor.HttpContext.GetLanguage());

            var user = new User(email, password, passwordConfirm, language);
            await _userCreatorDomainService.CreateAsync(user, cancellationToken);
            await _userWriteRepository.CreateAsync(user, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            await _accessTokenSetterDomainService.SetAsync(user, cancellationToken);
            _refreshTokenSetterDomainService.Set(user);

            return new(user);
        }
    }
}
