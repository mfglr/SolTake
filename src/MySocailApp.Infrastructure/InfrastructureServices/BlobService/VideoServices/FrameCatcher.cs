using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.InfrastructureServices.BlobService.VideoServices;
using MySocailApp.Core.Exceptions;
using OpenCvSharp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.VideoServices
{
    public class FrameCatcher(IBlobNameGenerator blobNameGenerator, IPathFinder pathFinder) : IFrameCatcher
    {
        private readonly IBlobNameGenerator _blobNameGenerator = blobNameGenerator;
        private readonly IPathFinder _pathFinder = pathFinder;

        public Task<AppImage> GetFrameAsync(string videoPath, string containerName, double value, CancellationToken cancellationToken)
            => Task.Run(
                () =>
                {
                    using var capture = new VideoCapture(videoPath);
                    using var frame = new Mat();
                    capture.Set(VideoCaptureProperties.PosMsec, value);
                    capture.Read(frame);

                    if (frame == null)
                        throw new ServerSideException();

                    var blobName = _blobNameGenerator.Generate(RootName.Image, containerName, "jpeg");
                    var pathName = _pathFinder.GetPath(RootName.Image, containerName, blobName);

                    if (!Cv2.ImWrite(pathName, frame))
                        throw new ServerSideException();

                    return new AppImage(containerName, blobName, new(frame.Height, frame.Width));
                },
                cancellationToken
            );
    }
}
