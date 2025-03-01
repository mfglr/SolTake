using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainServices;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateUserName
{
    public class UpdateUserNamehandler(UserNameUpdaterDomainService userNameUpdater, IUserAccessor userAccessor, IUnitOfWork unitOfWork) : IRequestHandler<UpdateUserNameDto>
    {
        private readonly UserNameUpdaterDomainService _userNameUpdater = userNameUpdater;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UpdateUserNameDto request, CancellationToken cancellationToken)
        {
            await _userNameUpdater.UpdateAsync(_userAccessor.User, new(request.UserName), cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
