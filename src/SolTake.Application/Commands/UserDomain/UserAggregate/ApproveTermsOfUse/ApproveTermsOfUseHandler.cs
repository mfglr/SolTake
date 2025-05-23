using MediatR;
using SolTake.Application.InfrastructureServices;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.ApproveTermsOfUse
{
    public class ApproveTermsOfUseHandler(IUserAccessor userAccessor, IUnitOfWork unitOfWork) : IRequestHandler<ApproveTermsOfUse>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(ApproveTermsOfUse request, CancellationToken cancellationToken)
        {
            _userAccessor.User.ApproveTermsOfUse();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
