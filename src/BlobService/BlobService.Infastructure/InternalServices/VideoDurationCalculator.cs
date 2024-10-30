using OpenCvSharp;

namespace BlobService.Infastructure.InternalServices
{
    internal static class VideoDurationCalculator
    {
        public static double Calculate(VideoCapture videoCapture)
            => videoCapture.Get(VideoCaptureProperties.FrameCount) / videoCapture.Get(VideoCaptureProperties.Fps);
    }
}
