using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserAggregate.DomainServices;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.RemoveUserImage
{
    public class RemoveUserImageHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, UserManipulator userImageManipulator) : IRequestHandler<RemoveUserImageDto,RemoveUserImageResponseDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly UserManipulator _userImageManipulator = userImageManipulator;

        public async Task<RemoveUserImageResponseDto> Handle(RemoveUserImageDto request, CancellationToken cancellationToken)
        {
            await _userImageManipulator.RemoveImageAsync(_userAccessor.User, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new(_userAccessor.User);
        }
    }
}
