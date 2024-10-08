using AutoMapper;
using MediatR;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByPassword
{
    public class LoginByPasswordHandler(IMapper mapper, PasswordAuthenticatorDomainService passwordAuthenticator, IAccountWriteRepository accountWriteRepository) : IRequestHandler<LoginByPasswordDto, AccountDto>
    {
        private readonly IMapper _mapper = mapper;
        private readonly PasswordAuthenticatorDomainService _passwordAuthenticator = passwordAuthenticator;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;

        public async Task<AccountDto> Handle(LoginByPasswordDto request, CancellationToken cancellationToken)
        {
            var account = await _accountWriteRepository.GetAccountByEmailAsync(request.EmailOrUserName, cancellationToken);
            account ??= 
                    await _accountWriteRepository.GetAccountByUserNameAsync(request.EmailOrUserName, cancellationToken) ??
                    throw new LoginFailedException();

            await _passwordAuthenticator.LoginAsync(account, request.Password, cancellationToken);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
