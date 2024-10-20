using MySocailApp.Application.InfrastructureServices.BlobService.VideoServices;
using MySocailApp.Core.Exceptions;
using OpenCvSharp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.VideoServices
{
    public class VideoDurationCalculator : IVideoDurationCalculator
    {
        public Task<double> CalculateAsync(string path, CancellationToken cancellationToken)
            => Task.Run(
                () =>
                {
                    using var capture = new VideoCapture(path);
                    if (!capture.IsOpened())
                        throw new ServerSideException();
                    return capture.Get(VideoCaptureProperties.FrameCount) / capture.Get(VideoCaptureProperties.Fps);
                },
                cancellationToken
            );
    }
}
