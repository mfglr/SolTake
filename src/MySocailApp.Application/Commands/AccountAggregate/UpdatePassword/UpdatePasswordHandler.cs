using AccountDomain.ValueObjects;
using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdatePassword
{
    public class UpdatePasswordHandler(IAccountAccessor accountAccessor, IUnitOfWork unitOfWork) : IRequestHandler<UpdatePasswordDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UpdatePasswordDto request, CancellationToken cancellationToken)
        {
            var account = _accountAccessor.Account;
            var currentPassword = new Password(request.CurrentPassword);
            var newPassword = new Password(request.NewPassword);
            var newPasswordConfirm = new Password(request.NewPasswordConfirmation);
            account.UpdatePassword(currentPassword, newPassword, newPasswordConfirm);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
