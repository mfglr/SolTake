using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserAggregate.DomainServices;
using SolTake.Domain.UserAggregate.Entities;
using SolTake.Domain.UserAggregate.Exceptions;
using SolTake.Domain.UserAggregate.ValueObjects;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.LoginByPassword
{
    public class LoginByPasswordHandler(AuthenticatorDomainService authenticatorDomainService, IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, AccessTokenSetterDomainService accessTokenSetterDomainService) : IRequestHandler<LoginByPasswordDto, LoginDto>
    {
        private readonly AuthenticatorDomainService _authenticatorDomainService = authenticatorDomainService;
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
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

            return new(user);
        }
    }
}
