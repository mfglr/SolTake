using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.UserAggregate.Abstracts;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateUserImage
{
    public class UpdateUserImageHandler(IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IMultimediaService multiMediaService, IBlobService blobService) : IRequestHandler<UpdateUserImageDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMultimediaService _multiMediaService = multiMediaService;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IBlobService _blobService = blobService;

        public async Task Handle(UpdateUserImageDto request, CancellationToken cancellationToken)
        {
            var id = _accessTokenReader.GetRequiredAccountId();
            var user = await _userWriteRepository.GetByIdAsync(id, cancellationToken);

            await _blobService.MoveAsync(id.ToString(), ContainerName.ProfileImages, ContainerName.Trash, cancellationToken);

            try
            {
                var image = await _multiMediaService.UploadAsync(ContainerName.ProfileImages, request.File, cancellationToken, id.ToString());
                user.UpdateImage(image);
                await _unitOfWork.CommitAsync(cancellationToken);
            }
            catch (Exception)
            {
                await _blobService.MoveAsync(id.ToString(), ContainerName.Trash, ContainerName.ProfileImages, cancellationToken);
                throw;
            }
        }
    }
}
