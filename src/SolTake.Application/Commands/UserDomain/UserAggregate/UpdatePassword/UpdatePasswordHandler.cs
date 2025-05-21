using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdatePassword
{
    public class UpdatePasswordHandler(IUserAccessor userAccessor, IUnitOfWork unitOfWork) : IRequestHandler<UpdatePasswordDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UpdatePasswordDto request, CancellationToken cancellationToken)
        {
            var account = _userAccessor.User;
            var currentPassword = new Password(request.CurrentPassword);
            var newPassword = new Password(request.NewPassword);
            var newPasswordConfirm = new Password(request.NewPasswordConfirmation);
            account.UpdatePassword(currentPassword, newPassword, newPasswordConfirm);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
