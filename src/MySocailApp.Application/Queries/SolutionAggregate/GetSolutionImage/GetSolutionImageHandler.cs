using MediatR;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionImage
{
    public class GetSolutionImageHandler(ISolutionReadRepository repository, IBlobService blobService) : IRequestHandler<GetSolutionImageDto, Stream>
    {
        private readonly ISolutionReadRepository _repository = repository;
        private readonly IBlobService _blobService = blobService;

        public async Task<Stream> Handle(GetSolutionImageDto request, CancellationToken cancellationToken)
        {
            var solution =
                await _repository.GetSolutionWithImagesByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();
            
            var image = 
                solution.Images.FirstOrDefault(x => x.Id == request.SolutionImageId) ??
                throw new SolutionImageIsNotFoundException();

            return await _blobService.ReadAsync(ContainerName.SolutionImages, image.BlobName, cancellationToken);
        }
    }
}
