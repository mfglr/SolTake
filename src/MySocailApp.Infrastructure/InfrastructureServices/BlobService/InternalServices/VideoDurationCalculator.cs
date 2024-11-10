using OpenCvSharp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class VideoDurationCalculator
    {
        public double Calculate(VideoCapture videoCapture)
            => videoCapture.Get(VideoCaptureProperties.FrameCount) / videoCapture.Get(VideoCaptureProperties.Fps);
    }
}
