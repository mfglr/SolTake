using MySocailApp.Core.Exceptions;
using OpenCvSharp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class VideoDurationCalculator
    {
        public double Calculate(string input)
        {
            VideoCapture? videoCapture = null;
            try
            {
                //load video
                videoCapture = new VideoCapture(input);
                if (!videoCapture.IsOpened())
                    throw new ServerSideException();

                //calculate duration
                var duration = videoCapture.Get(VideoCaptureProperties.FrameCount) / videoCapture.Get(VideoCaptureProperties.Fps);
                
                videoCapture.Dispose();

                return duration;
            }
            catch (Exception)
            {
                videoCapture?.Dispose();
                throw;
            }
            
        }
    }
}
