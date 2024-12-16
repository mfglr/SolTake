using MediatR;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserImageById
{
    public class GetUserImageByIdHandler(IUserReadRepository repository, IBlobService blobService) : IRequestHandler<GetUserImageById, Stream>
    {
        private readonly IUserReadRepository _repository = repository;
        private readonly IBlobService _blobService = blobService;

        public async Task<Stream> Handle(GetUserImageById request, CancellationToken cancellationToken)
        {
            var user =
                await _repository.GetAsync(request.UserId, cancellationToken) ??
                throw new UserNotFoundException();

            if(user.Image != null)
                return await _blobService.ReadAsync(ContainerName.ProfileImages, user.Image.BlobName, cancellationToken);
            return await _blobService.ReadAsync(ContainerName.ProfileImages, DefaultBlobNames.NoProfileImage,cancellationToken);
        }
    }
}
