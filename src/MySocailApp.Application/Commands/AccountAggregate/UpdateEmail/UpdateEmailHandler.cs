using AccountDomain.AccountAggregate.DomainServices;
using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmail
{
    public class UpdateEmailHandler(EmailUpdaterDomainService emailUpdater, IUnitOfWork unitOfWork, IAccountAccessor accountAccessor) : IRequestHandler<UpdateEmailDto>
    {
        private readonly EmailUpdaterDomainService _emailUpdater = emailUpdater;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;

        public async Task Handle(UpdateEmailDto request, CancellationToken cancellationToken)
        {
            await _emailUpdater.UpdateAsync(_accountAccessor.Account, request.Email, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
