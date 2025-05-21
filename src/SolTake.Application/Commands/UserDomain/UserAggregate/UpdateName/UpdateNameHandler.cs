using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.DomainServices;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateName
{
    public class UpdateNameHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, UserManipulator userManipulator) : IRequestHandler<UpdateNameDto, UpdateNameResponseDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly UserManipulator _userManipulator = userManipulator;

        public async Task<UpdateNameResponseDto> Handle(UpdateNameDto request, CancellationToken cancellationToken)
        {
            await _userManipulator.UpdateNameAsync(_userAccessor.User,request.Name,cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            return new(_userAccessor.User);
        }
    }
}
