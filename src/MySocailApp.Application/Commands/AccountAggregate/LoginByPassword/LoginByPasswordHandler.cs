using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.DomainServices;
using AccountDomain.AccountAggregate.Entities;
using AccountDomain.AccountAggregate.Exceptions;
using AccountDomain.AccountAggregate.ValueObjects;
using AutoMapper;
using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByPassword
{
    public class LoginByPasswordHandler(IMapper mapper, AuthenticatorDomainService authenticatorDomainService, IAccountWriteRepository accountWriteRepository, IUnitOfWork unitOfWork, AccessTokenSetterDomainService accessTokenSetterDomainService, RefreshTokenSetterDomainService refreshTokenSetterDomainService) : IRequestHandler<LoginByPasswordDto, AccountDto>
    {
        private readonly IMapper _mapper = mapper;
        private readonly AuthenticatorDomainService _authenticatorDomainService = authenticatorDomainService;
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
        private readonly RefreshTokenSetterDomainService _refreshTokenSetterDomainService = refreshTokenSetterDomainService;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;


        public async Task<AccountDto> Handle(LoginByPasswordDto request, CancellationToken cancellationToken)
        {
            var password = new Password(request.Password);
            Account account;
            try
            {
                var email = new Email(request.EmailOrUserName);
                account =
                    await _accountWriteRepository.GetAccountByEmailAsync(email, cancellationToken) ??
                    throw new LoginFailedException();
            }
            catch (InvalidEmailException)
            {
                var userName = new UserName(request.EmailOrUserName);
                account =
                    await _accountWriteRepository.GetAccountByUserNameAsync(userName, cancellationToken) ??
                    throw new LoginFailedException();
            }

            if (!account.CheckPassword(password))
                throw new LoginFailedException();

            await _authenticatorDomainService.LoginAsync(account, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            await _accessTokenSetterDomainService.SetAsync(account, cancellationToken);
            _refreshTokenSetterDomainService.Set(account);

            return _mapper.Map<AccountDto>(account);
        }
    }
}
