using OpenCvSharp;
using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Core.Exceptions;

namespace SolTake.Infrastructure.InfrastructureServices.BlobService
{
    public class FrameCatcher(IPathFinder pathFinder, IImageToBase64Convertor imageToBase64) : IFrameCatcher
    {
        private readonly IPathFinder _pathFinder = pathFinder;
        private readonly IImageToBase64Convertor _imageToBase64 = imageToBase64;

        public string CatchFrame(string contaninerName, string blobName, double position)
        {
            var path = _pathFinder.GetPath(contaninerName, blobName);

            //catch frame
            using var videoCapture = new VideoCapture(path);
            using var frame = new Mat();
            videoCapture.Set(VideoCaptureProperties.PosMsec, position);
            if (!videoCapture.Read(frame))
                throw new ServerSideException();

            return _imageToBase64.ToBase64(frame.ToBytes(".webp"), "webp");
        }

        public byte[] CatchFrameToBytes(string contaninerName, string blobName, double position)
        {
            var path = _pathFinder.GetPath(contaninerName, blobName);

            //catch frame
            using var videoCapture = new VideoCapture(path);
            using var frame = new Mat();
            videoCapture.Set(VideoCaptureProperties.PosMsec, position);
            if (!videoCapture.Read(frame))
                throw new ServerSideException();

            return frame.ToBytes(".webp");
        }
    }
}
