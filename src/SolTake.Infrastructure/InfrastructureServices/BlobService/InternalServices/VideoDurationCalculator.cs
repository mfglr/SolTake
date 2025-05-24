using OpenCvSharp;
using SolTake.Core.Exceptions;

namespace SolTake.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class VideoDurationCalculator
    {
        public double Calculate(string input)
        {
            using VideoCapture videoCapture = new(input);
            if (!videoCapture.IsOpened())
                throw new ServerSideException();

            return videoCapture.Get(VideoCaptureProperties.FrameCount) / videoCapture.Get(VideoCaptureProperties.Fps);
        }
    }
}
