using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.AccountAggregate.ApproveTermsOfUse
{
    public class ApproveTermsOfUseHandler(IAccountAccessor accountAccessor, IUnitOfWork unitOfWork) : IRequestHandler<ApproveTermsOfUse>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(ApproveTermsOfUse request, CancellationToken cancellationToken)
        {
            _accountAccessor.Account.ApproveTermsOfUse();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
