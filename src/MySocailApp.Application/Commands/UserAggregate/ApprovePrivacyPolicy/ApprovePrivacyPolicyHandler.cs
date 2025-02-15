using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.UserAggregate.ApprovePrivacyPolicy
{
    public class ApprovePrivacyPolicyHandler(IUserAccessor accountAccessor, IUnitOfWork unitOfWork) : IRequestHandler<ApprovePrivacyPolicyDto>
    {
        private readonly IUserAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(ApprovePrivacyPolicyDto request, CancellationToken cancellationToken)
        {
            _accountAccessor.User.ApprovePrivacyPolicy();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
