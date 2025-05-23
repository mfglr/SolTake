using MediatR;
using SolTake.Application.Extentions;
using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Application.InfrastructureServices.BlobService.Objects;

namespace SolTake.Application.Queries.CatchFrame
{
    public class CatchFrameHandler(IFrameCatcher frameCatcher, ITempDirectoryService tempDirectoryService, IPathFinder pathFinder) : IRequestHandler<CatchFrameDto, byte[]>
    {
        private readonly IFrameCatcher _frameCatcher = frameCatcher;
        private readonly ITempDirectoryService _tempDirectoryService = tempDirectoryService;
        private readonly IPathFinder _pathFinder = pathFinder;

        public Task<byte[]> Handle(CatchFrameDto request, CancellationToken cancellationToken) =>
            _tempDirectoryService.CreateTransactionAsync(
                async () =>
                {
                    var frameBlobName = _frameCatcher.CatchFrame(request.ContainerName, request.BlobName, request.Position);

                    using var stream = File.OpenRead(_pathFinder.GetPath(ContainerName.Temp, frameBlobName));
                    var bytes = await stream.ToByteArrayAsync();
                    stream.Close();

                    return bytes;
                }
            );
    }
}
