using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.UserAggregate.ApprovePrivacyPolicy
{
    public class ApprovePrivacyPolicyHandler(IAccountAccessor accountAccessor, IUnitOfWork unitOfWork) : IRequestHandler<ApprovePrivacyPolicyDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(ApprovePrivacyPolicyDto request, CancellationToken cancellationToken)
        {
            _accountAccessor.Account.ApprovePrivacyPolicy();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
