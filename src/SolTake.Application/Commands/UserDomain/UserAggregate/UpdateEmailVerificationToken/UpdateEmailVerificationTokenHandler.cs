using MediatR;
using SolTake.Application.InfrastructureServices;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.UpdateEmailVerificationToken
{
    public class UpdateEmailVerificationTokenHandler(IUserAccessor userAccessor, IUnitOfWork unitOfWork) : IRequestHandler<UpdateEmailVerificationTokenDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;


        public async Task Handle(UpdateEmailVerificationTokenDto request, CancellationToken cancellationToken)
        {
            _userAccessor.User.UpdateEmailVerificationToken();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
