using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainServices;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateEmail
{
    public class UpdateEmailHandler(EmailUpdaterDomainService emailUpdater, IUnitOfWork unitOfWork, IUserAccessor userAccessor) : IRequestHandler<UpdateEmailDto>
    {
        private readonly EmailUpdaterDomainService _emailUpdater = emailUpdater;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async Task Handle(UpdateEmailDto request, CancellationToken cancellationToken)
        {
            await _emailUpdater.UpdateAsync(_userAccessor.User, request.Email, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
