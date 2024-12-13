using MediatR;
using MySocailApp.Application.Extentions;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.AppUserAggregate.Abstracts;

namespace MySocailApp.Application.Commands.UserAggregate.RemoveUserImage
{
    public class RemoveUserImageHandler(IAppUserWriteRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IBlobService blobService) : IRequestHandler<RemoveUserImageDto, byte[]>
    {
        private readonly IAppUserWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;

        public async Task<byte[]> Handle(RemoveUserImageDto request, CancellationToken cancellationToken)
        {
            var id = _accessTokenReader.GetRequiredAccountId();
            var user = await _repository.GetByIdAsync(id, cancellationToken);
            user.RemoveImage();
            await _unitOfWork.CommitAsync(cancellationToken);

            var stream = await _blobService.ReadAsync(ContainerName.ProfileImages, DefaultBlobNames.NoProfileImage, cancellationToken);
            return await stream.ToByteArrayAsync();
        }
    }
}
