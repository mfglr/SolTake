using MediatR;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionVideo
{
    public class GetSolutionVideoHandler(IVideoService videoService, ISolutionReadRepository solutionReadRepository) : IRequestHandler<GetSolutionVideoDto, byte[]>
    {
        private readonly IVideoService _videoService = videoService;
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;

        public async Task<byte[]> Handle(GetSolutionVideoDto request, CancellationToken cancellationToken)
        {
            var solution = 
                await _solutionReadRepository.GetAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();

            if (solution.Video == null)
                throw new SolutionVideoNotFoundException();

            return await _videoService.ReadAsync(ContainerName.SolutionVideos, solution.Video.BlobName);
        }
    }
}
