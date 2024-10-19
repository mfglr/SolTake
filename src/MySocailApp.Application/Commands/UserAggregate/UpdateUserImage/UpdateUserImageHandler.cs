using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService.ImageServices;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Domain.AppUserAggregate.Abstracts;
using MySocailApp.Domain.AppUserAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateUserImage
{
    public class UpdateUserImageHandler(IAppUserWriteRepository appUserRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IImageService blobService) : IRequestHandler<UpdateUserImageDto>
    {
        private readonly IImageService _blobService = blobService;
        private readonly IAppUserWriteRepository _appUserRepository = appUserRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(UpdateUserImageDto request, CancellationToken cancellationToken)
        {
            var id = _accessTokenReader.GetRequiredAccountId();
            var user = await _appUserRepository.GetByIdAsync(id, cancellationToken);
            
            var image = await _blobService.UploadAsync(ContainerName.UserImages,request.File, cancellationToken);
            var profileImage = new ProfileImage(image.BlobName, DateTime.UtcNow);

            user.UpdateImage(profileImage);
            
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
