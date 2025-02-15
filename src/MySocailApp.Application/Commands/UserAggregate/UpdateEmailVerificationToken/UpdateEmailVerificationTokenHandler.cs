using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateEmailVerificationToken
{
    public class UpdateEmailVerificationTokenHandler(IAccountAccessor accountAccessor, IUnitOfWork unitOfWork) : IRequestHandler<UpdateEmailVerificationTokenDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;


        public async Task Handle(UpdateEmailVerificationTokenDto request, CancellationToken cancellationToken)
        {
            _accountAccessor.Account.UpdateEmailVerificationToken();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
