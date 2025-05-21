using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.DomainServices;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateUserName
{
    public class UpdateUserNamehandler(IUserAccessor userAccessor, IUnitOfWork unitOfWork, UserManipulator userManipulator) : IRequestHandler<UpdateUserNameDto, UpdateUserNameResponseDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly UserManipulator _userManipulator = userManipulator;

        public async Task<UpdateUserNameResponseDto> Handle(UpdateUserNameDto request, CancellationToken cancellationToken)
        {
            await _userManipulator.UpdateUserNameAsync(_userAccessor.User, new(request.UserName), cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            return new(_userAccessor.User);
        }
    }
}
