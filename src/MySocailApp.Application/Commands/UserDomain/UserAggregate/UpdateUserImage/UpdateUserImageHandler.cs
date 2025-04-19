using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.DomainServices;
using MySocailApp.Domain.UserAggregate.Abstracts;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateUserImage
{
    public class UpdateUserImageHandler(IUnitOfWork unitOfWork, IMultimediaService multiMediaService, IBlobService blobService, IUserAccessor userAccessor, UserManipulator userImageManipulator) : IRequestHandler<UpdateUserImageDto, UpdateUserImageResponseDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMultimediaService _multiMediaService = multiMediaService;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IBlobService _blobService = blobService;
        private readonly UserManipulator _userImageManipulator = userImageManipulator;


        public async Task<UpdateUserImageResponseDto> Handle(UpdateUserImageDto request, CancellationToken cancellationToken)
        {
            Multimedia? image = null;
            try
            {
                image = await _multiMediaService.UploadAsync(ContainerName.ProfileImages, request.File, cancellationToken);
                await _userImageManipulator.UpdateImageAsync(_userAccessor.User, image, cancellationToken);
                await _unitOfWork.CommitAsync(cancellationToken);
                return new(_userAccessor.User);
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
