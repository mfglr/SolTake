using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.UserAggregate.LogOut
{
    public class LogOutHandler(IUserAccessor userAccessor, IUnitOfWork unitOfWork) : IRequestHandler<LogOutDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(LogOutDto request, CancellationToken cancellationToken)
        {
            _userAccessor.User.Logout();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
