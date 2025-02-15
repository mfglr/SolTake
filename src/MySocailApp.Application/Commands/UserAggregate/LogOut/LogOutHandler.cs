using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.UserAggregate.LogOut
{
    public class LogOutHandler(IAccountAccessor accountAccessor, IUnitOfWork unitOfWork) : IRequestHandler<LogOutDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(LogOutDto request, CancellationToken cancellationToken)
        {
            _accountAccessor.Account.Logout();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
