using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.AppUserAggregate.ValueObjects;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateUserImage
{
    public class UpdateUserImageHandler(IAppUserWriteRepository appUserRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IBlobService blobService) : IRequestHandler<UpdateUserImageDto>
    {
        private readonly IBlobService _blobService = blobService;
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
