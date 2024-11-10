using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.AppUserAggregate.Abstracts;
using MySocailApp.Domain.AppUserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateUserImage
{
    public class UpdateUserImageHandler(IAppUserWriteRepository appUserRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IImageService imageService) : IRequestHandler<UpdateUserImageDto>
    {
        private readonly IImageService _imageService = imageService;
        private readonly IAppUserWriteRepository _appUserRepository = appUserRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(UpdateUserImageDto request, CancellationToken cancellationToken)
        {
            var id = _accessTokenReader.GetRequiredAccountId();
            var user = await _appUserRepository.GetByIdAsync(id, cancellationToken);
            
            var image = await _imageService.UploadAsync(ContainerName.ProfileImages, request.File, cancellationToken);
            var profileImage = new ProfileImage(image.BlobName, DateTime.UtcNow);

            user.UpdateImage(profileImage);
            
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
