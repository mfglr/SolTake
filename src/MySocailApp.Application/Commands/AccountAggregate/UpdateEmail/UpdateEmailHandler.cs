using AutoMapper;
using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmail
{
    public class UpdateEmailHandler(IMapper mapper, IAccessTokenReader tokenReader, EmailUpdaterDomainService emailUpdater, IAccountWriteRepository accountWriteRepository) : IRequestHandler<UpdateEmailDto, AccountDto>
    {
        private readonly EmailUpdaterDomainService _emailUpdater = emailUpdater;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMapper _mapper = mapper;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;

        public async Task<AccountDto> Handle(UpdateEmailDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account =
                await _accountWriteRepository.GetAccountAsync(accountId, cancellationToken) ??
                throw new AccountNotFoundException();

            await _emailUpdater.UpdateAsync(account, request.Email);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
