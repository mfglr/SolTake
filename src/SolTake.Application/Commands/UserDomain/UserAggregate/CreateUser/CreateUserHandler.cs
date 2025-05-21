using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Extentions;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserAggregate.DomainServices;
using SolTake.Domain.UserAggregate.Entities;
using SolTake.Domain.UserAggregate.Exceptions;
using SolTake.Domain.UserAggregate.ValueObjects;


namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.CreateUser
{
    public class CreateUserHandler(UserCreatorDomainService userCreatorDomainService, IHttpContextAccessor contextAccessor, IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, AccessTokenSetterDomainService accessTokenSetterDomainService) : IRequestHandler<CreateUserDto, LoginDto>
    {
        private readonly UserCreatorDomainService _userCreatorDomainService = userCreatorDomainService;
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<LoginDto> Handle(CreateUserDto request, CancellationToken cancellationToken)
        {

            var password = new Password(request.Password);
            var passwordConfirm = new Password(request.PasswordConfirm);
            if (!password.CompareValue(passwordConfirm))
                throw new PassowordAndPasswordConfirmationNotMatchException();

            //create user
            var email = new Email(request.Email);
            var language = new Language(_contextAccessor.HttpContext.GetLanguage());
            var user = new User(email, password, language);
            await _userCreatorDomainService.CreateAsync(user, cancellationToken);
            await _userWriteRepository.CreateAsync(user, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            await _accessTokenSetterDomainService.SetAsync(user, cancellationToken);

            return new(user);
        }
    }
}
