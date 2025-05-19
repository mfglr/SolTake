using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using OpenCvSharp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class VideoDimentionCalculator
    {
        public Dimention Calculate(string path)
        {
            using var videoCapture = new VideoCapture(path);
            if(!videoCapture.IsOpened())
                return new(0, 0);
            return new (videoCapture.Get(VideoCaptureProperties.FrameHeight), videoCapture.Get(VideoCaptureProperties.FrameWidth));
        }
    }
}
