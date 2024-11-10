using MediatR;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionVideo
{
    public class GetSolutionVideoHandler(IBlobService blobService, ISolutionReadRepository solutionReadRepository) : IRequestHandler<GetSolutionVideoDto, Stream>
    {
        private readonly IBlobService _blobService = blobService;
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;

        public async Task<Stream> Handle(GetSolutionVideoDto request, CancellationToken cancellationToken)
        {
            var solution =
                await _solutionReadRepository.GetAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();

            if (solution.Video == null)
                throw new SolutionVideoNotFoundException();
            return await _blobService.ReadAsync(ContainerName.SolutionVideos, solution.Video.BlobName, cancellationToken);
        }
    }
}
