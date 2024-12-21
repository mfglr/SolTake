using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.UserAggregate.Abstracts;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateUserImage
{
    public class UpdateUserImageHandler(IUserWriteRepository appUserRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IMultimediaService multiMediaService) : IRequestHandler<UpdateUserImageDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMultimediaService _multiMediaService = multiMediaService;
        private readonly IUserWriteRepository _appUserRepository = appUserRepository;

        public async Task Handle(UpdateUserImageDto request, CancellationToken cancellationToken)
        {
            var id = _accessTokenReader.GetRequiredAccountId();
            var user = await _appUserRepository.GetByIdAsync(id, cancellationToken);

            var image = await _multiMediaService.UploadAsync(ContainerName.ProfileImages, request.File, cancellationToken);
            user.UpdateImage(image);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
