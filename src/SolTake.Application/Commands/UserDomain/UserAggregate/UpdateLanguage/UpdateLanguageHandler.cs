using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateLanguage
{
    public class UpdateLanguageHandler(IUserAccessor userAccessor, IUnitOfWork unitOfWork) : IRequestHandler<UpdateLanguageDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UpdateLanguageDto request, CancellationToken cancellationToken)
        {
            _userAccessor.User.UpdateLanguage(new(request.Language));
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
