using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Core.Exceptions;
using OpenCvSharp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class FrameCatcher(UniqNameGenerator blobNameGenerator, IBlobService blobService, TempDirectoryService tempDirectoryService)
    {
        private readonly UniqNameGenerator _blobNameGenerator = blobNameGenerator;
        private readonly IBlobService _blobService = blobService;
        private readonly TempDirectoryService _tempDirectoryService = tempDirectoryService;

        public async Task<string> SaveFrameAsync(string path, string containerName, CancellationToken cancellationToken)
        {
            using var videoCapture = new VideoCapture(path);

            //Catch frame
            using var frame = new Mat();
            videoCapture.Set(VideoCaptureProperties.PosMsec, 0);
            if (!videoCapture.Read(frame))
                throw new ServerSideException();

            //save file to temp directory;
            var tempBlobName = _blobNameGenerator.Generate("webp");
            var tempPath = _tempDirectoryService.GetBlobPath(tempBlobName);
            frame.SaveImage(tempPath, new ImageEncodingParam(ImwriteFlags.WebPQuality, 100));

            //save frame to blob
            var blobName = _blobNameGenerator.Generate("webp");
            using var file = File.OpenRead(tempPath);
            await _blobService.UploadAsync(file, containerName, blobName, cancellationToken);
            file.Close();

            return blobName;
        }
    }
}
