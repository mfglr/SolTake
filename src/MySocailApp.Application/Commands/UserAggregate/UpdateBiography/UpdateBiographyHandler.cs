using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateBiography
{
    public class UpdateBiographyHandler(IUnitOfWork unitOfWork,IUserAccessor userAccessor) : IRequestHandler<UpdateBiographyDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async Task Handle(UpdateBiographyDto request, CancellationToken cancellationToken)
        {
            _userAccessor.User.UpdateBiography(new(request.Biography));
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
