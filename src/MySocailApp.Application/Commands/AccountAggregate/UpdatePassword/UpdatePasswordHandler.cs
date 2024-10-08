using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdatePassword
{
    public class UpdatePasswordHandler(IAccessTokenReader tokenReader, IMapper mapper, PasswordUpdaterDomainService passwordUpdaterDomainService,IAccountWriteRepository accountWriteRepository) : IRequestHandler<UpdatePasswordDto, AccountDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMapper _mapper = mapper;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly PasswordUpdaterDomainService _passwordUpdaterDomainService = passwordUpdaterDomainService;

        public async Task<AccountDto> Handle(UpdatePasswordDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account =
                await _accountWriteRepository.GetAccountAsync(accountId, cancellationToken) ??
                throw new AccountNotFoundException();

            await _passwordUpdaterDomainService.UpdateAsync(account, request.CurrentPassword, request.NewPassword, request.NewPasswordConfirmation);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
