using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateUserImage
{
    public class UpdateUserImageHandler(IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IMultimediaService multiMediaService, IBlobService blobService) : IRequestHandler<UpdateUserImageDto, Multimedia>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMultimediaService _multiMediaService = multiMediaService;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IBlobService _blobService = blobService;

        public async Task<Multimedia> Handle(UpdateUserImageDto request, CancellationToken cancellationToken)
        {
            var id = _accessTokenReader.GetRequiredAccountId();
            var user = await _userWriteRepository.GetByIdAsync(id, cancellationToken);

            Multimedia? image = null;
            try
            {
                image = await _multiMediaService.UploadAsync(ContainerName.ProfileImages, request.File, cancellationToken);
                user.UpdateImage(image);
                await _unitOfWork.CommitAsync(cancellationToken);
                return image;
            }
            catch (Exception)
            {
                if (image != null)
                    await _blobService.DeleteAsync(ContainerName.ProfileImages, image.BlobName, cancellationToken);
                throw;
            }
        }
    }
}
