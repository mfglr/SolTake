using MediatR;
using SolTake.Application.InfrastructureServices.BlobService;

namespace SolTake.Application.Queries.CatchFrame
{
    public class CatchFrameHandler(IFrameCatcher frameCatcher) : IRequestHandler<CatchFrameDto, byte[]>
    {
        private readonly IFrameCatcher _frameCatcher = frameCatcher;

        public Task<byte[]> Handle(CatchFrameDto request, CancellationToken cancellationToken) =>
            Task.FromResult(_frameCatcher.CatchFrameToBytes(request.ContainerName, request.BlobName, request.Position));
    }
}
