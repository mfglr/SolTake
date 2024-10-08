using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.ApproveTermsOfUse
{
    public class ApproveTermsOfUseHandler(IAccountWriteRepository accountWriteRepository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<ApproveTermsOfUse>
    {
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(ApproveTermsOfUse request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var account =
                await _accountWriteRepository.GetAccountAsync(accountId, cancellationToken) ??
                throw new AccountNotFoundException();
            account.ApproveTermsOfUse();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
