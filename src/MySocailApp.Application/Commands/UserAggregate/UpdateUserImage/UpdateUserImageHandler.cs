using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateUserImage
{
    public class UpdateUserImageHandler(IAppUserRepository appUserRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, UserImageUpdater userImageEditor) : IRequestHandler<UpdateUserImageDto>
    {
        private readonly IAppUserRepository _appUserRepository = appUserRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly UserImageUpdater _userImageEditor = userImageEditor;

        public async Task Handle(UpdateUserImageDto request, CancellationToken cancellationToken)
        {
            var id = _accessTokenReader.GetRequiredAccountId();
            var user = await _appUserRepository.GetByIdAsync(id, cancellationToken);
            using var stream = request.file.OpenReadStream();
            
            await _userImageEditor.UpdateAsync(user, stream, cancellationToken);
            
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
