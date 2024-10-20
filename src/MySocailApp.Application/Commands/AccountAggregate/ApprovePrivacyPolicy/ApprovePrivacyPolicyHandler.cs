using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.ApprovePrivacyPolicy
{
    public class ApprovePrivacyPolicyHandler(IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IAccountWriteRepository accountWriteRepository) : IRequestHandler<ApprovePrivacyPolicyDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;

        public async Task Handle(ApprovePrivacyPolicyDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var account =
                await _accountWriteRepository.GetAccountAsync(accountId, cancellationToken) ??
                throw new AccountNotFoundException();

            account.ApprovePrivacyPolicy();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
