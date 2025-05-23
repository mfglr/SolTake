using MediatR;
using SolTake.Application.InfrastructureServices;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.ApprovePrivacyPolicy
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
