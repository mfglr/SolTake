using AccountDomain.AccountAggregate.DomainServices;
using AccountDomain.AccountAggregate.ValueObjects;
using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateUserName
{
    public class UpdateUserNamehandler(UserNameUpdaterDomainService userNameUpdater, IAccountAccessor accountAccessor, IUnitOfWork unitOfWork) : IRequestHandler<UpdateUserNameDto>
    {
        private readonly UserNameUpdaterDomainService _userNameUpdater = userNameUpdater;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UpdateUserNameDto request, CancellationToken cancellationToken)
        {
            var userName = new UserName(request.UserName);
            await _userNameUpdater.UpdateAsync(_accountAccessor.Account, userName, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
