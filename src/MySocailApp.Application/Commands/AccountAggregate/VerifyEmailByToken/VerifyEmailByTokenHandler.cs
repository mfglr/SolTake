using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.VerifyEmailByToken
{
    public class VerifyEmailByTokenHandler(IAccessTokenReader tokenReader, EmailVerifierDomainService emailVerifier, IAccountWriteRepository accountWriteRepository) : IRequestHandler<VerifyEmailByTokenDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly EmailVerifierDomainService _emailVerifier = emailVerifier;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;

        public async Task Handle(VerifyEmailByTokenDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account =
                await _accountWriteRepository.GetAccountAsync(accountId, cancellationToken) ??
                throw new AccountNotFoundException();
            await _emailVerifier.VerifyAsync(account, request.Token);
        }
    }
}
