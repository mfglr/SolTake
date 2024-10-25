using MediatR;
using MySocailApp.Application.InfrastructureServices.BlobService.ImageServices;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.AppUserAggregate.Abstracts;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserImageById
{
    public class GetUserImageByIdHandler(IAppUserReadRepository repository, IImageService blobService) : IRequestHandler<GetUserImageById, byte[]>
    {
        private readonly IAppUserReadRepository _repository = repository;
        private readonly IImageService _blobService = blobService;

        public async Task<byte[]> Handle(GetUserImageById request, CancellationToken cancellationToken)
        {
            var user = 
                await _repository.GetAsync(request.UserId, cancellationToken) ?? 
                throw new UserNotFoundException();

            if(user.Image == null) throw new UserImageIsNotAvailableException();

            return await _blobService.ReadAsync(ContainerName.UserImages, user.Image.BlobName, cancellationToken);
        }
    }
}
