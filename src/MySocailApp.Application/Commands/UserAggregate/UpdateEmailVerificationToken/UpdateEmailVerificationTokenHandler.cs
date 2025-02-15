using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateEmailVerificationToken
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
