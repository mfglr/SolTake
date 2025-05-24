using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Application.InfrastructureServices.BlobService.Objects;
using SolTake.Infrastructure.InfrastructureServices.BlobService.InternalServices;
using OpenCvSharp;
using SolTake.Core.Exceptions;

namespace SolTake.Infrastructure.InfrastructureServices.BlobService
{
    public class FrameCatcher(UniqNameGenerator blobNameGenerator, IPathFinder pathFinder) : IFrameCatcher
    {
        private readonly UniqNameGenerator _blobNameGenerator = blobNameGenerator;
        private readonly IPathFinder _pathFinder = pathFinder;

        public string CatchFrame(string contaninerName, string blobName, double position)
        {
            var path = _pathFinder.GetPath(contaninerName,blobName);

            //catch frame
            using var videoCapture = new VideoCapture(path);
            using var frame = new Mat();
            videoCapture.Set(VideoCaptureProperties.PosMsec, position);
            if (!videoCapture.Read(frame))
                throw new ServerSideException();

            //save file to temp directory;
            var tempBlobName = _blobNameGenerator.Generate("webp");
            var tempPath = _pathFinder.GetPath(ContainerName.Temp, tempBlobName);
            frame.SaveImage(tempPath, new ImageEncodingParam(ImwriteFlags.WebPQuality, 100));

            return tempBlobName;
        }
    }
}
