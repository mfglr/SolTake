using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateName
{
    public class UpdateNameHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor) : IRequestHandler<UpdateNameDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async Task Handle(UpdateNameDto request, CancellationToken cancellationToken)
        {
            _userAccessor.User.UpdateName(request.Name);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
