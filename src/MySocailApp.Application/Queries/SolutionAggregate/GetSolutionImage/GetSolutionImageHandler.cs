using MediatR;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.Extentions;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionImage
{
    public class GetSolutionImageHandler(ISolutionReadRepository repository, IBlobService blobService) : IRequestHandler<GetSolutionImageDto, byte[]>
    {
        private readonly ISolutionReadRepository _repository = repository;
        private readonly IBlobService _blobService = blobService;

        public async Task<byte[]> Handle(GetSolutionImageDto request, CancellationToken cancellationToken)
        {
            var solution =
                await _repository.GetByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();

            if (!solution.Images.Any(x => x.BlobName == request.BlobName))
                throw new SolutionImageIsNotFoundException();

            using var stream  = _blobService.Read(ContainerName.SolutionImages,request.BlobName);
            return await stream.ToByteArrayAsync();
        }
    }
}
