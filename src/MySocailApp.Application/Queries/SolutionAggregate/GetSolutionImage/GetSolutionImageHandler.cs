using MediatR;
using MySocailApp.Application.ApplicationServices.BlobService.ImageServices;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionImage
{
    public class GetSolutionImageHandler(ISolutionReadRepository repository, IImageService blobService) : IRequestHandler<GetSolutionImageDto, byte[]>
    {
        private readonly ISolutionReadRepository _repository = repository;
        private readonly IImageService _blobService = blobService;

        public async Task<byte[]> Handle(GetSolutionImageDto request, CancellationToken cancellationToken)
        {
            var solution =
                await _repository.GetSolutionWithImagesByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();
            
            var image = 
                solution.Images.FirstOrDefault(x => x.Id == request.SolutionImageId) ??
                throw new SolutionImageIsNotFoundException();

            return await _blobService.ReadAsync(ContainerName.SolutionImages, image.BlobName);
        }
    }
}
