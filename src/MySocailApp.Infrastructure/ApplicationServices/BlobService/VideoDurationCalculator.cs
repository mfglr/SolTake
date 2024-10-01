using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Core.Exceptions;
using OpenCvSharp;

namespace MySocailApp.Infrastructure.ApplicationServices.BlobService
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
